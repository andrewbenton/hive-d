/**
 * Autogenerated by Thrift Compiler (0.9.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
module hive.thrift.TCLIService_types;

import thrift.base;
import thrift.codegen.base;
import thrift.util.hashset;

enum TProtocolVersion {
  HIVE_CLI_SERVICE_PROTOCOL_V1 = 0,
  HIVE_CLI_SERVICE_PROTOCOL_V2 = 1,
  HIVE_CLI_SERVICE_PROTOCOL_V3 = 2,
  HIVE_CLI_SERVICE_PROTOCOL_V4 = 3,
  HIVE_CLI_SERVICE_PROTOCOL_V5 = 4,
  HIVE_CLI_SERVICE_PROTOCOL_V6 = 5,
  HIVE_CLI_SERVICE_PROTOCOL_V7 = 6,
  HIVE_CLI_SERVICE_PROTOCOL_V8 = 7,
  HIVE_CLI_SERVICE_PROTOCOL_V9 = 8
}

enum TTypeId {
  BOOLEAN_TYPE = 0,
  TINYINT_TYPE = 1,
  SMALLINT_TYPE = 2,
  INT_TYPE = 3,
  BIGINT_TYPE = 4,
  FLOAT_TYPE = 5,
  DOUBLE_TYPE = 6,
  STRING_TYPE = 7,
  TIMESTAMP_TYPE = 8,
  BINARY_TYPE = 9,
  ARRAY_TYPE = 10,
  MAP_TYPE = 11,
  STRUCT_TYPE = 12,
  UNION_TYPE = 13,
  USER_DEFINED_TYPE = 14,
  DECIMAL_TYPE = 15,
  NULL_TYPE = 16,
  DATE_TYPE = 17,
  VARCHAR_TYPE = 18,
  CHAR_TYPE = 19,
  INTERVAL_YEAR_MONTH_TYPE = 20,
  INTERVAL_DAY_TIME_TYPE = 21
}

enum TStatusCode {
  SUCCESS_STATUS = 0,
  SUCCESS_WITH_INFO_STATUS = 1,
  STILL_EXECUTING_STATUS = 2,
  ERROR_STATUS = 3,
  INVALID_HANDLE_STATUS = 4
}

enum TOperationState {
  INITIALIZED_STATE = 0,
  RUNNING_STATE = 1,
  FINISHED_STATE = 2,
  CANCELED_STATE = 3,
  CLOSED_STATE = 4,
  ERROR_STATE = 5,
  UKNOWN_STATE = 6,
  PENDING_STATE = 7,
  TIMEDOUT_STATE = 8
}

enum TOperationType {
  EXECUTE_STATEMENT = 0,
  GET_TYPE_INFO = 1,
  GET_CATALOGS = 2,
  GET_SCHEMAS = 3,
  GET_TABLES = 4,
  GET_TABLE_TYPES = 5,
  GET_COLUMNS = 6,
  GET_FUNCTIONS = 7,
  UNKNOWN = 8
}

enum TGetInfoType {
  CLI_MAX_DRIVER_CONNECTIONS = 0,
  CLI_MAX_CONCURRENT_ACTIVITIES = 1,
  CLI_DATA_SOURCE_NAME = 2,
  CLI_FETCH_DIRECTION = 8,
  CLI_SERVER_NAME = 13,
  CLI_SEARCH_PATTERN_ESCAPE = 14,
  CLI_DBMS_NAME = 17,
  CLI_DBMS_VER = 18,
  CLI_ACCESSIBLE_TABLES = 19,
  CLI_ACCESSIBLE_PROCEDURES = 20,
  CLI_CURSOR_COMMIT_BEHAVIOR = 23,
  CLI_DATA_SOURCE_READ_ONLY = 25,
  CLI_DEFAULT_TXN_ISOLATION = 26,
  CLI_IDENTIFIER_CASE = 28,
  CLI_IDENTIFIER_QUOTE_CHAR = 29,
  CLI_MAX_COLUMN_NAME_LEN = 30,
  CLI_MAX_CURSOR_NAME_LEN = 31,
  CLI_MAX_SCHEMA_NAME_LEN = 32,
  CLI_MAX_CATALOG_NAME_LEN = 34,
  CLI_MAX_TABLE_NAME_LEN = 35,
  CLI_SCROLL_CONCURRENCY = 43,
  CLI_TXN_CAPABLE = 46,
  CLI_USER_NAME = 47,
  CLI_TXN_ISOLATION_OPTION = 72,
  CLI_INTEGRITY = 73,
  CLI_GETDATA_EXTENSIONS = 81,
  CLI_NULL_COLLATION = 85,
  CLI_ALTER_TABLE = 86,
  CLI_ORDER_BY_COLUMNS_IN_SELECT = 90,
  CLI_SPECIAL_CHARACTERS = 94,
  CLI_MAX_COLUMNS_IN_GROUP_BY = 97,
  CLI_MAX_COLUMNS_IN_INDEX = 98,
  CLI_MAX_COLUMNS_IN_ORDER_BY = 99,
  CLI_MAX_COLUMNS_IN_SELECT = 100,
  CLI_MAX_COLUMNS_IN_TABLE = 101,
  CLI_MAX_INDEX_SIZE = 102,
  CLI_MAX_ROW_SIZE = 104,
  CLI_MAX_STATEMENT_LEN = 105,
  CLI_MAX_TABLES_IN_SELECT = 106,
  CLI_MAX_USER_NAME_LEN = 107,
  CLI_OJ_CAPABILITIES = 115,
  CLI_XOPEN_CLI_YEAR = 10000,
  CLI_CURSOR_SENSITIVITY = 10001,
  CLI_DESCRIBE_PARAMETER = 10002,
  CLI_CATALOG_NAME = 10003,
  CLI_COLLATION_SEQ = 10004,
  CLI_MAX_IDENTIFIER_LEN = 10005
}

enum TFetchOrientation {
  FETCH_NEXT = 0,
  FETCH_PRIOR = 1,
  FETCH_RELATIVE = 2,
  FETCH_ABSOLUTE = 3,
  FETCH_FIRST = 4,
  FETCH_LAST = 5
}

alias int TTypeEntryPtr;

alias string TIdentifier;

alias string TPattern;

alias string TPatternOrIdentifier;

struct TTypeQualifierValue {
  int i32Value;
  string stringValue;
  
  mixin TStructHelpers!([
    TFieldMeta(`i32Value`, 1, TReq.OPTIONAL),
    TFieldMeta(`stringValue`, 2, TReq.OPTIONAL)
  ]);
}

struct TTypeQualifiers {
  TTypeQualifierValue[string] qualifiers;
  
  mixin TStructHelpers!([
    TFieldMeta(`qualifiers`, 1, TReq.REQUIRED)
  ]);
}

struct TPrimitiveTypeEntry {
  TTypeId type;
  TTypeQualifiers typeQualifiers;
  
  mixin TStructHelpers!([
    TFieldMeta(`type`, 1, TReq.REQUIRED),
    TFieldMeta(`typeQualifiers`, 2, TReq.OPTIONAL)
  ]);
}

struct TArrayTypeEntry {
  TTypeEntryPtr objectTypePtr;
  
  mixin TStructHelpers!([
    TFieldMeta(`objectTypePtr`, 1, TReq.REQUIRED)
  ]);
}

struct TMapTypeEntry {
  TTypeEntryPtr keyTypePtr;
  TTypeEntryPtr valueTypePtr;
  
  mixin TStructHelpers!([
    TFieldMeta(`keyTypePtr`, 1, TReq.REQUIRED),
    TFieldMeta(`valueTypePtr`, 2, TReq.REQUIRED)
  ]);
}

struct TStructTypeEntry {
  TTypeEntryPtr[string] nameToTypePtr;
  
  mixin TStructHelpers!([
    TFieldMeta(`nameToTypePtr`, 1, TReq.REQUIRED)
  ]);
}

struct TUnionTypeEntry {
  TTypeEntryPtr[string] nameToTypePtr;
  
  mixin TStructHelpers!([
    TFieldMeta(`nameToTypePtr`, 1, TReq.REQUIRED)
  ]);
}

struct TUserDefinedTypeEntry {
  string typeClassName;
  
  mixin TStructHelpers!([
    TFieldMeta(`typeClassName`, 1, TReq.REQUIRED)
  ]);
}

struct TTypeEntry {
  TPrimitiveTypeEntry primitiveEntry;
  TArrayTypeEntry arrayEntry;
  TMapTypeEntry mapEntry;
  TStructTypeEntry structEntry;
  TUnionTypeEntry unionEntry;
  TUserDefinedTypeEntry userDefinedTypeEntry;
  
  mixin TStructHelpers!([
    TFieldMeta(`primitiveEntry`, 1, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`arrayEntry`, 2, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`mapEntry`, 3, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`structEntry`, 4, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`unionEntry`, 5, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`userDefinedTypeEntry`, 6, TReq.OPT_IN_REQ_OUT)
  ]);
}

struct TTypeDesc {
  TTypeEntry[] types;
  
  mixin TStructHelpers!([
    TFieldMeta(`types`, 1, TReq.REQUIRED)
  ]);
}

struct TColumnDesc {
  string columnName;
  TTypeDesc typeDesc;
  int position;
  string comment;
  
  mixin TStructHelpers!([
    TFieldMeta(`columnName`, 1, TReq.REQUIRED),
    TFieldMeta(`typeDesc`, 2, TReq.REQUIRED),
    TFieldMeta(`position`, 3, TReq.REQUIRED),
    TFieldMeta(`comment`, 4, TReq.OPTIONAL)
  ]);
}

struct TTableSchema {
  TColumnDesc[] columns;
  
  mixin TStructHelpers!([
    TFieldMeta(`columns`, 1, TReq.REQUIRED)
  ]);
}

struct TBoolValue {
  bool value;
  
  mixin TStructHelpers!([
    TFieldMeta(`value`, 1, TReq.OPTIONAL)
  ]);
}

struct TByteValue {
  byte value;
  
  mixin TStructHelpers!([
    TFieldMeta(`value`, 1, TReq.OPTIONAL)
  ]);
}

struct TI16Value {
  short value;
  
  mixin TStructHelpers!([
    TFieldMeta(`value`, 1, TReq.OPTIONAL)
  ]);
}

struct TI32Value {
  int value;
  
  mixin TStructHelpers!([
    TFieldMeta(`value`, 1, TReq.OPTIONAL)
  ]);
}

struct TI64Value {
  long value;
  
  mixin TStructHelpers!([
    TFieldMeta(`value`, 1, TReq.OPTIONAL)
  ]);
}

struct TDoubleValue {
  double value;
  
  mixin TStructHelpers!([
    TFieldMeta(`value`, 1, TReq.OPTIONAL)
  ]);
}

struct TStringValue {
  string value;
  
  mixin TStructHelpers!([
    TFieldMeta(`value`, 1, TReq.OPTIONAL)
  ]);
}

struct TColumnValue {
  TBoolValue boolVal;
  TByteValue byteVal;
  TI16Value i16Val;
  TI32Value i32Val;
  TI64Value i64Val;
  TDoubleValue doubleVal;
  TStringValue stringVal;
  
  mixin TStructHelpers!([
    TFieldMeta(`boolVal`, 1, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`byteVal`, 2, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`i16Val`, 3, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`i32Val`, 4, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`i64Val`, 5, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`doubleVal`, 6, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`stringVal`, 7, TReq.OPT_IN_REQ_OUT)
  ]);
}

struct TRow {
  TColumnValue[] colVals;
  
  mixin TStructHelpers!([
    TFieldMeta(`colVals`, 1, TReq.REQUIRED)
  ]);
}

struct TBoolColumn {
  bool[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TByteColumn {
  byte[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TI16Column {
  short[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TI32Column {
  int[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TI64Column {
  long[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TDoubleColumn {
  double[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TStringColumn {
  string[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TBinaryColumn {
  string[] values;
  string nulls;
  
  mixin TStructHelpers!([
    TFieldMeta(`values`, 1, TReq.REQUIRED),
    TFieldMeta(`nulls`, 2, TReq.REQUIRED)
  ]);
}

struct TColumn {
  TBoolColumn boolVal;
  TByteColumn byteVal;
  TI16Column i16Val;
  TI32Column i32Val;
  TI64Column i64Val;
  TDoubleColumn doubleVal;
  TStringColumn stringVal;
  TBinaryColumn binaryVal;
  
  mixin TStructHelpers!([
    TFieldMeta(`boolVal`, 1, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`byteVal`, 2, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`i16Val`, 3, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`i32Val`, 4, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`i64Val`, 5, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`doubleVal`, 6, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`stringVal`, 7, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`binaryVal`, 8, TReq.OPT_IN_REQ_OUT)
  ]);
}

struct TRowSet {
  long startRowOffset;
  TRow[] rows;
  TColumn[] columns;
  string binaryColumns;
  int columnCount;
  
  mixin TStructHelpers!([
    TFieldMeta(`startRowOffset`, 1, TReq.REQUIRED),
    TFieldMeta(`rows`, 2, TReq.REQUIRED),
    TFieldMeta(`columns`, 3, TReq.OPTIONAL),
    TFieldMeta(`binaryColumns`, 4, TReq.OPTIONAL),
    TFieldMeta(`columnCount`, 5, TReq.OPTIONAL)
  ]);
}

struct TStatus {
  TStatusCode statusCode;
  string[] infoMessages;
  string sqlState;
  int errorCode;
  string errorMessage;
  
  mixin TStructHelpers!([
    TFieldMeta(`statusCode`, 1, TReq.REQUIRED),
    TFieldMeta(`infoMessages`, 2, TReq.OPTIONAL),
    TFieldMeta(`sqlState`, 3, TReq.OPTIONAL),
    TFieldMeta(`errorCode`, 4, TReq.OPTIONAL),
    TFieldMeta(`errorMessage`, 5, TReq.OPTIONAL)
  ]);
}

struct THandleIdentifier {
  string guid;
  string secret;
  
  mixin TStructHelpers!([
    TFieldMeta(`guid`, 1, TReq.REQUIRED),
    TFieldMeta(`secret`, 2, TReq.REQUIRED)
  ]);
}

struct TSessionHandle {
  THandleIdentifier sessionId;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionId`, 1, TReq.REQUIRED)
  ]);
}

struct TOperationHandle {
  THandleIdentifier operationId;
  TOperationType operationType;
  bool hasResultSet;
  double modifiedRowCount;
  
  mixin TStructHelpers!([
    TFieldMeta(`operationId`, 1, TReq.REQUIRED),
    TFieldMeta(`operationType`, 2, TReq.REQUIRED),
    TFieldMeta(`hasResultSet`, 3, TReq.REQUIRED),
    TFieldMeta(`modifiedRowCount`, 4, TReq.OPTIONAL)
  ]);
}

struct TOpenSessionReq {
  TProtocolVersion client_protocol;
  string username;
  string password;
  string[string] configuration;
  
  mixin TStructHelpers!([
    TFieldMeta(`client_protocol`, 1, TReq.REQUIRED, q{cast(TProtocolVersion)8}),
    TFieldMeta(`username`, 2, TReq.OPTIONAL),
    TFieldMeta(`password`, 3, TReq.OPTIONAL),
    TFieldMeta(`configuration`, 4, TReq.OPTIONAL)
  ]);
}

struct TOpenSessionResp {
  TStatus status;
  TProtocolVersion serverProtocolVersion;
  TSessionHandle sessionHandle;
  string[string] configuration;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`serverProtocolVersion`, 2, TReq.REQUIRED, q{cast(TProtocolVersion)8}),
    TFieldMeta(`sessionHandle`, 3, TReq.OPTIONAL),
    TFieldMeta(`configuration`, 4, TReq.OPTIONAL)
  ]);
}

struct TCloseSessionReq {
  TSessionHandle sessionHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TCloseSessionResp {
  TStatus status;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED)
  ]);
}

struct TGetInfoValue {
  string stringValue;
  short smallIntValue;
  int integerBitmask;
  int integerFlag;
  int binaryValue;
  long lenValue;
  
  mixin TStructHelpers!([
    TFieldMeta(`stringValue`, 1, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`smallIntValue`, 2, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`integerBitmask`, 3, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`integerFlag`, 4, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`binaryValue`, 5, TReq.OPT_IN_REQ_OUT),
    TFieldMeta(`lenValue`, 6, TReq.OPT_IN_REQ_OUT)
  ]);
}

struct TGetInfoReq {
  TSessionHandle sessionHandle;
  TGetInfoType infoType;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`infoType`, 2, TReq.REQUIRED)
  ]);
}

struct TGetInfoResp {
  TStatus status;
  TGetInfoValue infoValue;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`infoValue`, 2, TReq.REQUIRED)
  ]);
}

struct TExecuteStatementReq {
  TSessionHandle sessionHandle;
  string statement;
  string[string] confOverlay;
  bool runAsync;
  long queryTimeout;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`statement`, 2, TReq.REQUIRED),
    TFieldMeta(`confOverlay`, 3, TReq.OPTIONAL),
    TFieldMeta(`runAsync`, 4, TReq.OPTIONAL, q{false}),
    TFieldMeta(`queryTimeout`, 5, TReq.OPTIONAL, q{0L})
  ]);
}

struct TExecuteStatementResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetTypeInfoReq {
  TSessionHandle sessionHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TGetTypeInfoResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetCatalogsReq {
  TSessionHandle sessionHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TGetCatalogsResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetSchemasReq {
  TSessionHandle sessionHandle;
  TIdentifier catalogName;
  TPatternOrIdentifier schemaName;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`catalogName`, 2, TReq.OPTIONAL),
    TFieldMeta(`schemaName`, 3, TReq.OPTIONAL)
  ]);
}

struct TGetSchemasResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetTablesReq {
  TSessionHandle sessionHandle;
  TPatternOrIdentifier catalogName;
  TPatternOrIdentifier schemaName;
  TPatternOrIdentifier tableName;
  string[] tableTypes;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`catalogName`, 2, TReq.OPTIONAL),
    TFieldMeta(`schemaName`, 3, TReq.OPTIONAL),
    TFieldMeta(`tableName`, 4, TReq.OPTIONAL),
    TFieldMeta(`tableTypes`, 5, TReq.OPTIONAL)
  ]);
}

struct TGetTablesResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetTableTypesReq {
  TSessionHandle sessionHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TGetTableTypesResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetColumnsReq {
  TSessionHandle sessionHandle;
  TIdentifier catalogName;
  TPatternOrIdentifier schemaName;
  TPatternOrIdentifier tableName;
  TPatternOrIdentifier columnName;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`catalogName`, 2, TReq.OPTIONAL),
    TFieldMeta(`schemaName`, 3, TReq.OPTIONAL),
    TFieldMeta(`tableName`, 4, TReq.OPTIONAL),
    TFieldMeta(`columnName`, 5, TReq.OPTIONAL)
  ]);
}

struct TGetColumnsResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetFunctionsReq {
  TSessionHandle sessionHandle;
  TIdentifier catalogName;
  TPatternOrIdentifier schemaName;
  TPatternOrIdentifier functionName;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`catalogName`, 2, TReq.OPTIONAL),
    TFieldMeta(`schemaName`, 3, TReq.OPTIONAL),
    TFieldMeta(`functionName`, 4, TReq.REQUIRED)
  ]);
}

struct TGetFunctionsResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetPrimaryKeysReq {
  TSessionHandle sessionHandle;
  TIdentifier catalogName;
  TIdentifier schemaName;
  TIdentifier tableName;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`catalogName`, 2, TReq.OPTIONAL),
    TFieldMeta(`schemaName`, 3, TReq.OPTIONAL),
    TFieldMeta(`tableName`, 4, TReq.OPTIONAL)
  ]);
}

struct TGetPrimaryKeysResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetCrossReferenceReq {
  TSessionHandle sessionHandle;
  TIdentifier parentCatalogName;
  TIdentifier parentSchemaName;
  TIdentifier parentTableName;
  TIdentifier foreignCatalogName;
  TIdentifier foreignSchemaName;
  TIdentifier foreignTableName;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`parentCatalogName`, 2, TReq.OPTIONAL),
    TFieldMeta(`parentSchemaName`, 3, TReq.OPTIONAL),
    TFieldMeta(`parentTableName`, 4, TReq.OPTIONAL),
    TFieldMeta(`foreignCatalogName`, 5, TReq.OPTIONAL),
    TFieldMeta(`foreignSchemaName`, 6, TReq.OPTIONAL),
    TFieldMeta(`foreignTableName`, 7, TReq.OPTIONAL)
  ]);
}

struct TGetCrossReferenceResp {
  TStatus status;
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationHandle`, 2, TReq.OPTIONAL)
  ]);
}

struct TGetOperationStatusReq {
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`operationHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TGetOperationStatusResp {
  TStatus status;
  TOperationState operationState;
  string sqlState;
  int errorCode;
  string errorMessage;
  string taskStatus;
  long operationStarted;
  long operationCompleted;
  bool hasResultSet;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`operationState`, 2, TReq.OPTIONAL),
    TFieldMeta(`sqlState`, 3, TReq.OPTIONAL),
    TFieldMeta(`errorCode`, 4, TReq.OPTIONAL),
    TFieldMeta(`errorMessage`, 5, TReq.OPTIONAL),
    TFieldMeta(`taskStatus`, 6, TReq.OPTIONAL),
    TFieldMeta(`operationStarted`, 7, TReq.OPTIONAL),
    TFieldMeta(`operationCompleted`, 8, TReq.OPTIONAL),
    TFieldMeta(`hasResultSet`, 9, TReq.OPTIONAL)
  ]);
}

struct TCancelOperationReq {
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`operationHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TCancelOperationResp {
  TStatus status;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED)
  ]);
}

struct TCloseOperationReq {
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`operationHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TCloseOperationResp {
  TStatus status;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED)
  ]);
}

struct TGetResultSetMetadataReq {
  TOperationHandle operationHandle;
  
  mixin TStructHelpers!([
    TFieldMeta(`operationHandle`, 1, TReq.REQUIRED)
  ]);
}

struct TGetResultSetMetadataResp {
  TStatus status;
  TTableSchema schema;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`schema`, 2, TReq.OPTIONAL)
  ]);
}

struct TFetchResultsReq {
  TOperationHandle operationHandle;
  TFetchOrientation orientation;
  long maxRows;
  short fetchType;
  
  mixin TStructHelpers!([
    TFieldMeta(`operationHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`orientation`, 2, TReq.REQUIRED, q{cast(TFetchOrientation)0}),
    TFieldMeta(`maxRows`, 3, TReq.REQUIRED),
    TFieldMeta(`fetchType`, 4, TReq.OPTIONAL, q{cast(short)0})
  ]);
}

struct TFetchResultsResp {
  TStatus status;
  bool hasMoreRows;
  TRowSet results;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`hasMoreRows`, 2, TReq.OPTIONAL),
    TFieldMeta(`results`, 3, TReq.OPTIONAL)
  ]);
}

struct TGetDelegationTokenReq {
  TSessionHandle sessionHandle;
  string owner;
  string renewer;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`owner`, 2, TReq.REQUIRED),
    TFieldMeta(`renewer`, 3, TReq.REQUIRED)
  ]);
}

struct TGetDelegationTokenResp {
  TStatus status;
  string delegationToken;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED),
    TFieldMeta(`delegationToken`, 2, TReq.OPTIONAL)
  ]);
}

struct TCancelDelegationTokenReq {
  TSessionHandle sessionHandle;
  string delegationToken;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`delegationToken`, 2, TReq.REQUIRED)
  ]);
}

struct TCancelDelegationTokenResp {
  TStatus status;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED)
  ]);
}

struct TRenewDelegationTokenReq {
  TSessionHandle sessionHandle;
  string delegationToken;
  
  mixin TStructHelpers!([
    TFieldMeta(`sessionHandle`, 1, TReq.REQUIRED),
    TFieldMeta(`delegationToken`, 2, TReq.REQUIRED)
  ]);
}

struct TRenewDelegationTokenResp {
  TStatus status;
  
  mixin TStructHelpers!([
    TFieldMeta(`status`, 1, TReq.REQUIRED)
  ]);
}

