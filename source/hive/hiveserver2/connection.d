module hive.hiveserver2.connection;

import std.experimental.logger;
import std.format : format;

import hive.thrift.TCLIService;
import hive.thrift.TCLIService_constants;
import hive.thrift.TCLIService_types;

import thrift.codegen.client;     //TClient
import thrift.protocol.binary;    //TBinaryProtocol
import thrift.transport.base;
import thrift.transport.socket;   //TSocket
import thrift.transport.buffered; //TBufferedTransport

import hive.hiveserver2.operation;

alias HiveBinaryProtocol = TBinaryProtocol!();
alias HiveClient = TClient!(TCLIService, HiveBinaryProtocol, void);

class HS2Exception : Exception
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null)
    {
        super(msg, file, line, next);
    }
};

struct ConnectionSettings
{
    string host;
    string username = "hdfs";
    ushort port = 10000;
    string[string] configuration;
    TProtocolVersion protocolVersion;
}

class HS2Connection
{
    string host;
    string username = "hdfs";
    ushort port = 10000;
    string[string] configuration;
    TProtocolVersion protocolVersion;

    TSessionHandle sessionHandle;
    TTransport transport;
    HiveClient client;

    this(string host, string username = "hdfs", ushort port = 10000, string[string] configuration = null, TProtocolVersion protocolVersion = TProtocolVersion.HIVE_CLI_SERVICE_PROTOCOL_V6)
    {
        this.host = host;
        this.username = username;
        this.port = port;
        this.configuration = configuration;
        this.protocolVersion = protocolVersion;

        this.initialize;
    }

    this(ConnectionSettings settings)
    {
        this.host = settings.host;
        this.username = settings.username;
        this.port = settings.port;
        this.configuration = settings.configuration;
        this.protocolVersion = settings.protocolVersion;

        this.initialize;
    }

    void initialize()
    {
        TSocket sock = new TSocket(this.host, this.port);
        TBufferedTransport transport = new TBufferedTransport(sock);
        HiveBinaryProtocol proto = new HiveBinaryProtocol(transport);
        HiveClient client = new HiveClient(proto);

        this.transport = transport;
        this.client = client;

        this.transport.open();

        TOpenSessionReq req = TOpenSessionReq();
        req.client_protocol = this.protocolVersion;
        req.username = this.username;
        req.configuration = configuration;

        try
        {
            TOpenSessionResp rep = this.client.OpenSession(req);

            if(rep.status.statusCode != TStatus.statusCode.SUCCESS_STATUS)
                throw new HS2Exception("Failed to initialize session: %s".format(rep.status));

            if(rep.serverProtocolVersion != this.protocolVersion)
                throw new HS2Exception("Server returned protocol version %d, but expected %d".format(rep.serverProtocolVersion, this.protocolVersion));

            this.sessionHandle = rep.sessionHandle;
        }
        catch(Exception ex)
        {
            this.transport.close();
            throw ex;
        }
    }

    bool close()
    {
        if(this.transport.isOpen)
        {
            TCloseSessionReq req = TCloseSessionReq(this.sessionHandle);

            TCloseSessionResp resp = this.client.CloseSession(req);

            scope(exit) this.transport.close;

            if(resp.status.statusCode == TStatusCode.SUCCESS_STATUS)
                return true;
            else
            {
                sharedLog.warningf("Failed to close session %s because [%d] %s", this.sessionHandle.sessionId, resp.status.errorCode, resp.status.errorMessage);
                return false;
            }
        }
        else
        {
            sharedLog.infof("Transport already closed");
            return true;
        }
    }

    HS2Operation execute(string sql, string[string] config = null, bool async = false, long timeout = 0)
    {
        TExecuteStatementReq req = TExecuteStatementReq();
        req.sessionHandle = this.sessionHandle;
        req.statement = sql;
        req.confOverlay = config;
        req.runAsync = async;
        req.queryTimeout = timeout;

        TExecuteStatementResp resp = this.client.ExecuteStatement(req);

        if(resp.status.statusCode == TStatusCode.SUCCESS_STATUS)
            return new HS2Operation(this, resp.operationHandle);
        else
            throw new HS2Exception("Execution failed because [%d] %s".format(resp.status.errorCode, resp.status.errorMessage));
    }

    HS2Operation executeWithParams(string sql, string[string] params, string[string] config = null, bool async = false, long timeout = 0)
    {
        throw new HS2Exception("Not Implemented");
    }
}
