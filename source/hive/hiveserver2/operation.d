module hive.hiveserver2.operation;

import std.experimental.logger;
import std.format : format;

import hive.thrift.TCLIService;
import hive.thrift.TCLIService_constants;
import hive.thrift.TCLIService_types;

import hive.hiveserver2.connection;

enum MAX_LOG_ROWS = 100;

class HS2Operation
{
    HS2Connection connection;
    TOperationHandle handle;
    bool closed;

    this(HS2Connection connection, ref TOperationHandle handle) nothrow
    {
        this.connection = connection;
        this.handle = handle;
        this.closed = false;
    }

    ~this()
    {
        if(!this.closed)
        {
            TCloseOperationReq req = TCloseOperationReq(this.handle);

            TCloseOperationResp resp = this.connection.client.CloseOperation(req);

            if(resp.status.statusCode != TStatusCode.SUCCESS_STATUS)
                sharedLog.warningf("Failed to close handle to operation %s", handle.operationId);
        }
    }

    bool cancel()
    {
        TCancelOperationReq req = TCancelOperationReq(this.handle);

        TCancelOperationResp resp = this.connection.client.CancelOperation(req);

        if(resp.status.statusCode == TStatusCode.SUCCESS_STATUS)
            return true;
        else
        {
            sharedLog.warningf("Failed to cancel operation %s with code %s", this.handle.operationId, resp.status.statusCode);
            return false;
        }
    }

    auto poll()
    {
        TGetOperationStatusReq req = TGetOperationStatusReq(this.handle);

        return this.connection.client.GetOperationStatus(req);
    }

    string[] fetchLogs()
    {
        import std.array : array;
        import std.container.slist;

        SList!string logs;

        TFetchResultsReq req = TFetchResultsReq();
        req.operationHandle = this.handle;
        req.orientation = TFetchOrientation.FETCH_NEXT;
        req.maxRows = MAX_LOG_ROWS;
        req.fetchType = 1;

        //while(true)
        //{
            //TFetchResultsResp resp = this.connection.client.FetchResults(req);

            //if(resp.status.statusCode
        //}

        return logs.array;
    }

    auto fetchResults()
    {

    }
}
