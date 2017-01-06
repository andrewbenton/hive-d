module hive.thrift.sasltransport;

import std.format : format;

import thrift.transport.base;
import thrift.transport.socket;

import saslwrapped;

private enum SaslStatus
{
    START = 1,
    OK = 2,
    BAD = 3,
    ERROR = 4,
    COMPLETE = 5
}

class TSaslTransport : TBaseTransport {
    private
    {
        SaslClient _client;
        TTransport _transport;
        string mechanisms;
    }

    this(SaslClient saslClient, TTransport transport, string mechanisms = "PLAIN,DIGEST-MD5")
    {
        this._client = saslClient;
        this._transport = transport;
        this.mechanisms = mechanisms;
    }

    override bool isOpen()
    {
        return this._transport.isOpen;
    }

    override void open()
    {
        this._transport.open;

        if(!this._transport.isOpen)
            throw new TTransportException("Underlying transport isn't opened", TTransportException.Type.NOT_OPEN);

        string chosenMechanism, initialResponse;
        if(!this._client.start(this.mechanisms, chosenMechanism, initialResponse))
        {
            import std.format : format;
            string error;
            this._client.getError(error);
            throw new TTransportException("Failed to start SASL session because: %s".format(error));
        }

        this.sendMessage(SaslStatus.START, cast(ubyte[])chosenMechanism[]);
        this.sendMessage(SaslStatus.OK, cast(ubyte[])initialResponse[]);

        SaslStatus status;
        ubyte[] payload = new ubyte[](1024);
        string response;
        while(true)
        {
            status = this.recvSaslMessage(payload);
            if(status != SaslStatus.OK && status != SaslStatus.COMPLETE)
                throw new TTransportException("Transport doesn't appear to be open.  Status returned was %s".format(status));

            if(status == SaslStatus.COMPLETE)
                break;

            if(!this._client.step(cast(string)payload, response))
            {
                string error;
                this._client.getError(error);
                throw new TTransportException("Received a bad SASL response: %s".format(error));
            }

            this.sendMessage(SaslStatus.OK, cast(ubyte[])response[]);
        }
    }

    pragma(inline)
    private void sendMessage(SaslStatus status, in ubyte[] buff)
    {
        import std.bitmanip : nativeToBigEndian;

        ubyte[] _buff = new ubyte[](buff.length + 5);

        _buff[0] = cast(ubyte)status;
        ubyte[] lbuff = nativeToBigEndian(cast(uint)buff.length);
        _buff[1 .. 5] = lbuff[];
        _buff[5 .. $] = buff[];

        this._transport.write(_buff);
        this._transport.flush;
    }

    private SaslStatus recvSaslMessage(ref ubyte[] payload)
    {
        import std.bitmanip : bigEndianToNative;

        ubyte[5] header;
        this._transport.read(header);

        SaslStatus status = cast(SaslStatus)header[0];
        uint length = bigEndianToNative!(uint, 4)(header[1 .. 5]);

        if(length > 0)
        {
            maybeResize(payload, length);
            this._transport.read(payload[0 .. length]);
        }

        return status;
    }

    private static void maybeResize(T, S)(ref T arr, S length)
    {
        if(arr == null)
            arr = new T(length);
        else if(arr.length < length)
            arr.length = length;
    }

    override void flush()
    {
        //continue here
    }
}
