SELECT 'Upgrading MetaStore schema from 3.1.3000.7.2.17.0-Update1 to 3.1.3000.7.2.17.0-Update2';

USE SYS;

DROP TABLE IF EXISTS `COMPACTION_QUEUE`;
CREATE EXTERNAL TABLE IF NOT EXISTS `COMPACTION_QUEUE` (
  `CQ_ID` bigint,
  `CQ_DATABASE` string,
  `CQ_TABLE` string,
  `CQ_PARTITION` string,
  `CQ_STATE` string,
  `CQ_TYPE` string,
  `CQ_TBLPROPERTIES` string,
  `CQ_WORKER_ID` string,
  `CQ_ENQUEUE_TIME` bigint,
  `CQ_START` bigint,
  `CQ_RUN_AS` string,
  `CQ_HIGHEST_WRITE_ID` bigint,
  `CQ_HADOOP_JOB_ID` string,
  `CQ_ERROR_MESSAGE` string,
  `CQ_NEXT_TXN_ID` bigint,
  `CQ_TXN_ID` bigint,
  `CQ_COMMIT_TIME` bigint,
  `CQ_INITIATOR_ID` string,
  `CQ_INITIATOR_VERSION` string,
  `CQ_WORKER_VERSION` string,
  `CQ_CLEANER_START` bigint,
  `CQ_POOL_NAME` string,
  `CQ_NUMBER_OF_BUCKETS` string
)
STORED BY 'org.apache.hive.storage.jdbc.JdbcStorageHandler'
TBLPROPERTIES (
"hive.sql.database.type" = "METASTORE",
"hive.sql.query" =
"SELECT
  \"COMPACTION_QUEUE\".\"CQ_ID\",
  \"COMPACTION_QUEUE\".\"CQ_DATABASE\",
  \"COMPACTION_QUEUE\".\"CQ_TABLE\",
  \"COMPACTION_QUEUE\".\"CQ_PARTITION\",
  \"COMPACTION_QUEUE\".\"CQ_STATE\",
  \"COMPACTION_QUEUE\".\"CQ_TYPE\",
  \"COMPACTION_QUEUE\".\"CQ_TBLPROPERTIES\",
  \"COMPACTION_QUEUE\".\"CQ_WORKER_ID\",
  \"COMPACTION_QUEUE\".\"CQ_ENQUEUE_TIME\",
  \"COMPACTION_QUEUE\".\"CQ_START\",
  \"COMPACTION_QUEUE\".\"CQ_RUN_AS\",
  \"COMPACTION_QUEUE\".\"CQ_HIGHEST_WRITE_ID\",
  \"COMPACTION_QUEUE\".\"CQ_HADOOP_JOB_ID\",
  \"COMPACTION_QUEUE\".\"CQ_ERROR_MESSAGE\",
  \"COMPACTION_QUEUE\".\"CQ_NEXT_TXN_ID\",
  \"COMPACTION_QUEUE\".\"CQ_TXN_ID\",
  \"COMPACTION_QUEUE\".\"CQ_COMMIT_TIME\",
  \"COMPACTION_QUEUE\".\"CQ_INITIATOR_ID\",
  \"COMPACTION_QUEUE\".\"CQ_INITIATOR_VERSION\",
  \"COMPACTION_QUEUE\".\"CQ_WORKER_VERSION\",
  \"COMPACTION_QUEUE\".\"CQ_CLEANER_START\",
  \"COMPACTION_QUEUE\".\"CQ_POOL_NAME\",
  \"COMPACTION_QUEUE\".\"CQ_NUMBER_OF_BUCKETS\"
FROM \"COMPACTION_QUEUE\"
"
);

DROP TABLE IF EXISTS `COMPLETED_COMPACTIONS`;
CREATE EXTERNAL TABLE IF NOT EXISTS `COMPLETED_COMPACTIONS` (
  `CC_ID` bigint,
  `CC_DATABASE` string,
  `CC_TABLE` string,
  `CC_PARTITION` string,
  `CC_STATE` string,
  `CC_TYPE` string,
  `CC_TBLPROPERTIES` string,
  `CC_WORKER_ID` string,
  `CC_ENQUEUE_TIME` bigint,
  `CC_START` bigint,
  `CC_END` bigint,
  `CC_RUN_AS` string,
  `CC_HIGHEST_WRITE_ID` bigint,
  `CC_HADOOP_JOB_ID` string,
  `CC_ERROR_MESSAGE` string,
  `CC_NEXT_TXN_ID` bigint,
  `CC_TXN_ID` bigint,
  `CC_COMMIT_TIME` bigint,
  `CC_INITIATOR_ID` string,
  `CC_INITIATOR_VERSION` string,
  `CC_WORKER_VERSION` string,
  `CC_POOL_NAME` string,
  `CC_NUMBER_OF_BUCKETS` string
)
STORED BY 'org.apache.hive.storage.jdbc.JdbcStorageHandler'
TBLPROPERTIES (
"hive.sql.database.type" = "METASTORE",
"hive.sql.query" =
"SELECT
  \"COMPLETED_COMPACTIONS\".\"CC_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_DATABASE\",
  \"COMPLETED_COMPACTIONS\".\"CC_TABLE\",
  \"COMPLETED_COMPACTIONS\".\"CC_PARTITION\",
  \"COMPLETED_COMPACTIONS\".\"CC_STATE\",
  \"COMPLETED_COMPACTIONS\".\"CC_TYPE\",
  \"COMPLETED_COMPACTIONS\".\"CC_TBLPROPERTIES\",
  \"COMPLETED_COMPACTIONS\".\"CC_WORKER_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_ENQUEUE_TIME\",
  \"COMPLETED_COMPACTIONS\".\"CC_START\",
  \"COMPLETED_COMPACTIONS\".\"CC_END\",
  \"COMPLETED_COMPACTIONS\".\"CC_RUN_AS\",
  \"COMPLETED_COMPACTIONS\".\"CC_HIGHEST_WRITE_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_HADOOP_JOB_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_ERROR_MESSAGE\",
  \"COMPLETED_COMPACTIONS\".\"CC_NEXT_TXN_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_TXN_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_COMMIT_TIME\",
  \"COMPLETED_COMPACTIONS\".\"CC_INITIATOR_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_INITIATOR_VERSION\",
  \"COMPLETED_COMPACTIONS\".\"CC_WORKER_VERSION\",
  \"COMPLETED_COMPACTIONS\".\"CC_POOL_NAME\",
  \"COMPLETED_COMPACTIONS\".\"CC_NUMBER_OF_BUCKETS\"
FROM \"COMPLETED_COMPACTIONS\"
"
);

CREATE OR REPLACE VIEW `COMPACTIONS`
(
  `C_ID`,
  `C_CATALOG`,
  `C_DATABASE`,
  `C_TABLE`,
  `C_PARTITION`,
  `C_TYPE`,
  `C_STATE`,
  `C_WORKER_HOST`,
  `C_WORKER_ID`,
  `C_WORKER_VERSION`,
  `C_ENQUEUE_TIME`,
  `C_START`,
  `C_DURATION`,
  `C_HADOOP_JOB_ID`,
  `C_RUN_AS`,
  `C_ERROR_MESSAGE`,
  `C_NEXT_TXN_ID`,
  `C_TXN_ID`,
  `C_COMMIT_TIME`,
  `C_HIGHEST_WRITE_ID`,
  `C_INITIATOR_HOST`,
  `C_INITIATOR_ID`,
  `C_INITIATOR_VERSION`,
  `C_CLEANER_START`,
  `C_POOL_NAME`,
  `C_NUMBER_OF_BUCKETS`,
  `C_TBLPROPERTIES`
) AS
SELECT
    CC_ID,
    'default',
    CC_DATABASE,
    CC_TABLE,
    CC_PARTITION,
    CASE WHEN CC_TYPE = 'i' THEN 'minor' WHEN CC_TYPE = 'a' THEN 'major' ELSE 'UNKNOWN' END,
    CASE WHEN CC_STATE = 'f' THEN 'failed' WHEN CC_STATE = 's' THEN 'succeeded'
         WHEN CC_STATE = 'a' THEN 'did not initiate' WHEN CC_STATE = 'c' THEN 'refused' ELSE 'UNKNOWN' END,
    CASE WHEN CC_WORKER_ID IS NULL THEN cast (null as string) ELSE split(CC_WORKER_ID,"-")[0] END,
    CASE WHEN CC_WORKER_ID IS NULL THEN cast (null as string) ELSE split(CC_WORKER_ID,"-")[size(split(CC_WORKER_ID,"-"))-1] END,
    CC_WORKER_VERSION,
    FROM_UNIXTIME(CC_ENQUEUE_TIME DIV 1000),
    FROM_UNIXTIME(CC_START DIV 1000),
    CASE WHEN CC_END IS NULL THEN cast (null as string) ELSE CC_END-CC_START END,
  CC_HADOOP_JOB_ID,
  CC_RUN_AS,
  CC_ERROR_MESSAGE,
  CC_NEXT_TXN_ID,
  CC_TXN_ID,
  FROM_UNIXTIME(CC_COMMIT_TIME DIV 1000),
  CC_HIGHEST_WRITE_ID,
  CASE WHEN CC_INITIATOR_ID IS NULL THEN cast (null as string) ELSE split(CC_INITIATOR_ID,"-")[0] END,
  CASE WHEN CC_INITIATOR_ID IS NULL THEN cast (null as string) ELSE split(CC_INITIATOR_ID,"-")[size(split(CC_INITIATOR_ID,"-"))-1] END,
  CC_INITIATOR_VERSION,
  NULL,
  NVL(CC_POOL_NAME, 'default'),
  CC_NUMBER_OF_BUCKETS,
  CC_TBLPROPERTIES
FROM COMPLETED_COMPACTIONS
UNION ALL
SELECT
    CQ_ID,
    'default',
    CQ_DATABASE,
    CQ_TABLE,
    CQ_PARTITION,
    CASE WHEN CQ_TYPE = 'i' THEN 'minor' WHEN CQ_TYPE = 'a' THEN 'major' ELSE 'UNKNOWN' END,
    CASE WHEN CQ_STATE = 'i' THEN 'initiated' WHEN CQ_STATE = 'w' THEN 'working' WHEN CQ_STATE = 'r' THEN 'ready for cleaning' ELSE 'UNKNOWN' END,
    CASE WHEN CQ_WORKER_ID IS NULL THEN NULL ELSE split(CQ_WORKER_ID,"-")[0] END,
    CASE WHEN CQ_WORKER_ID IS NULL THEN NULL ELSE split(CQ_WORKER_ID,"-")[size(split(CQ_WORKER_ID,"-"))-1] END,
    CQ_WORKER_VERSION,
    FROM_UNIXTIME(CQ_ENQUEUE_TIME DIV 1000),
    FROM_UNIXTIME(CQ_START DIV 1000),
    cast (null as string),
    CQ_HADOOP_JOB_ID,
    CQ_RUN_AS,
    CQ_ERROR_MESSAGE,
    CQ_NEXT_TXN_ID,
    CQ_TXN_ID,
    FROM_UNIXTIME(CQ_COMMIT_TIME DIV 1000),
    CQ_HIGHEST_WRITE_ID,
    CASE WHEN CQ_INITIATOR_ID IS NULL THEN NULL ELSE split(CQ_INITIATOR_ID,"-")[0] END,
  CASE WHEN CQ_INITIATOR_ID IS NULL THEN NULL ELSE split(CQ_INITIATOR_ID,"-")[size(split(CQ_INITIATOR_ID,"-"))-1] END,
  CQ_INITIATOR_VERSION,
  FROM_UNIXTIME(CQ_CLEANER_START DIV 1000),
  NVL(CQ_POOL_NAME, 'default'),
  CQ_NUMBER_OF_BUCKETS,
  CQ_TBLPROPERTIES
FROM COMPACTION_QUEUE;

USE INFORMATION_SCHEMA;

CREATE OR REPLACE VIEW `COMPACTIONS`
(
  `C_ID`,
  `C_CATALOG`,
  `C_DATABASE`,
  `C_TABLE`,
  `C_PARTITION`,
  `C_TYPE`,
  `C_STATE`,
  `C_WORKER_HOST`,
  `C_WORKER_ID`,
  `C_WORKER_VERSION`,
  `C_ENQUEUE_TIME`,
  `C_START`,
  `C_DURATION`,
  `C_HADOOP_JOB_ID`,
  `C_RUN_AS`,
  `C_ERROR_MESSAGE`,
  `C_NEXT_TXN_ID`,
  `C_TXN_ID`,
  `C_COMMIT_TIME`,
  `C_HIGHEST_WRITE_ID`,
  `C_INITIATOR_HOST`,
  `C_INITIATOR_ID`,
  `C_INITIATOR_VERSION`,
  `C_CLEANER_START`,
  `C_POOL_NAME`,
  `C_NUMBER_OF_BUCKETS`,
  `C_TBLPROPERTIES`
) AS
SELECT DISTINCT
    C_ID,
    C_CATALOG,
    C_DATABASE,
    C_TABLE,
    C_PARTITION,
    C_TYPE,
    C_STATE,
    C_WORKER_HOST,
    C_WORKER_ID,
    C_WORKER_VERSION,
    C_ENQUEUE_TIME,
    C_START,
    C_DURATION,
    C_HADOOP_JOB_ID,
    C_RUN_AS,
    C_ERROR_MESSAGE,
    C_NEXT_TXN_ID,
    C_TXN_ID,
    C_COMMIT_TIME,
    C_HIGHEST_WRITE_ID,
    C_INITIATOR_HOST,
    C_INITIATOR_ID,
    C_INITIATOR_VERSION,
    C_CLEANER_START,
    C_POOL_NAME,
    C_NUMBER_OF_BUCKETS,
    C_TBLPROPERTIES
FROM
    `sys`.`COMPACTIONS` C JOIN `sys`.`TBLS` T ON (C.`C_TABLE` = T.`TBL_NAME`)
                          JOIN `sys`.`DBS` D ON (C.`C_DATABASE` = D.`NAME`)
                          LEFT JOIN `sys`.`TBL_PRIVS` P ON (T.`TBL_ID` = P.`TBL_ID`)
WHERE
    (NOT restrict_information_schema() OR P.`TBL_ID` IS NOT NULL
        AND (P.`PRINCIPAL_NAME`=current_user() AND P.`PRINCIPAL_TYPE`='USER'
            OR ((array_contains(current_groups(), P.`PRINCIPAL_NAME`) OR P.`PRINCIPAL_NAME` = 'public') AND P.`PRINCIPAL_TYPE`='GROUP'))
        AND P.`TBL_PRIV`='SELECT' AND P.`AUTHORIZER`=current_authorizer());

CREATE OR REPLACE VIEW `COLUMNS`
(
  `TABLE_CATALOG`,
  `TABLE_SCHEMA`,
  `TABLE_NAME`,
  `COLUMN_NAME`,
  `ORDINAL_POSITION`,
  `COLUMN_DEFAULT`,
  `IS_NULLABLE`,
  `DATA_TYPE`,
  `CHARACTER_MAXIMUM_LENGTH`,
  `CHARACTER_OCTET_LENGTH`,
  `NUMERIC_PRECISION`,
  `NUMERIC_PRECISION_RADIX`,
  `NUMERIC_SCALE`,
  `DATETIME_PRECISION`,
  `INTERVAL_TYPE`,
  `INTERVAL_PRECISION`,
  `CHARACTER_SET_CATALOG`,
  `CHARACTER_SET_SCHEMA`,
  `CHARACTER_SET_NAME`,
  `COLLATION_CATALOG`,
  `COLLATION_SCHEMA`,
  `COLLATION_NAME`,
  `UDT_CATALOG`,
  `UDT_SCHEMA`,
  `UDT_NAME`,
  `SCOPE_CATALOG`,
  `SCOPE_SCHEMA`,
  `SCOPE_NAME`,
  `MAXIMUM_CARDINALITY`,
  `DTD_IDENTIFIER`,
  `IS_SELF_REFERENCING`,
  `IS_IDENTITY`,
  `IDENTITY_GENERATION`,
  `IDENTITY_START`,
  `IDENTITY_INCREMENT`,
  `IDENTITY_MAXIMUM`,
  `IDENTITY_MINIMUM`,
  `IDENTITY_CYCLE`,
  `IS_GENERATED`,
  `GENERATION_EXPRESSION`,
  `IS_SYSTEM_TIME_PERIOD_START`,
  `IS_SYSTEM_TIME_PERIOD_END`,
  `SYSTEM_TIME_PERIOD_TIMESTAMP_GENERATION`,
  `IS_UPDATABLE`,
  `DECLARED_DATA_TYPE`,
  `DECLARED_NUMERIC_PRECISION`,
  `DECLARED_NUMERIC_SCALE`
) AS
SELECT DISTINCT
  'default',
  D.NAME,
  T.TBL_NAME,
  C.COLUMN_NAME,
  C.INTEGER_IDX,
  cast (null as string),
  'YES',
  C.TYPE_NAME as TYPE_NAME,
  CASE WHEN lower(C.TYPE_NAME) like 'varchar%' THEN cast(regexp_extract(upper(C.TYPE_NAME), '^VARCHAR\\s*\\((\\d+)\\s*\\)$', 1) as int)
       WHEN lower(C.TYPE_NAME) like 'char%'    THEN cast(regexp_extract(upper(C.TYPE_NAME),    '^CHAR\\s*\\((\\d+)\\s*\\)$', 1) as int)
       ELSE null END,
  CASE WHEN lower(C.TYPE_NAME) like 'varchar%' THEN cast(regexp_extract(upper(C.TYPE_NAME), '^VARCHAR\\s*\\((\\d+)\\s*\\)$', 1) as int)
       WHEN lower(C.TYPE_NAME) like 'char%'    THEN cast(regexp_extract(upper(C.TYPE_NAME),    '^CHAR\\s*\\((\\d+)\\s*\\)$', 1) as int)
       ELSE null END,
  CASE WHEN lower(C.TYPE_NAME) = 'bigint' THEN 19
       WHEN lower(C.TYPE_NAME) = 'int' THEN 10
       WHEN lower(C.TYPE_NAME) = 'smallint' THEN 5
       WHEN lower(C.TYPE_NAME) = 'tinyint' THEN 3
       WHEN lower(C.TYPE_NAME) = 'float' THEN 23
       WHEN lower(C.TYPE_NAME) = 'double' THEN 53
       WHEN lower(C.TYPE_NAME) like 'decimal%' THEN regexp_extract(upper(C.TYPE_NAME), '^DECIMAL\\s*\\((\\d+)',1)
       WHEN lower(C.TYPE_NAME) like 'numeric%' THEN regexp_extract(upper(C.TYPE_NAME), '^NUMERIC\\s*\\((\\d+)',1)
       ELSE null END,
  CASE WHEN lower(C.TYPE_NAME) = 'bigint' THEN 10
       WHEN lower(C.TYPE_NAME) = 'int' THEN 10
       WHEN lower(C.TYPE_NAME) = 'smallint' THEN 10
       WHEN lower(C.TYPE_NAME) = 'tinyint' THEN 10
       WHEN lower(C.TYPE_NAME) = 'float' THEN 2
       WHEN lower(C.TYPE_NAME) = 'double' THEN 2
       WHEN lower(C.TYPE_NAME) like 'decimal%' THEN 10
       WHEN lower(C.TYPE_NAME) like 'numeric%' THEN 10
       ELSE null END,
  CASE WHEN lower(C.TYPE_NAME) like 'decimal%' THEN regexp_extract(upper(C.TYPE_NAME), '^DECIMAL\\s*\\((\\d+),(\\d+)',2)
       WHEN lower(C.TYPE_NAME) like 'numeric%' THEN regexp_extract(upper(C.TYPE_NAME), '^NUMERIC\\s*\\((\\d+),(\\d+)',2)
       ELSE null END,
  CASE WHEN lower(C.TYPE_NAME) = 'date' THEN 0
       WHEN lower(C.TYPE_NAME) = 'timestamp' THEN 9
       ELSE null END,
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  C.CD_ID,
  'NO',
  'NO',
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  cast (null as string),
  'NEVER',
  cast (null as string),
  'NO',
  'NO',
  cast (null as string),
  'YES',
  C.TYPE_NAME as DECLARED_DATA_TYPE,
  CASE WHEN lower(C.TYPE_NAME) = 'bigint' THEN 19
       WHEN lower(C.TYPE_NAME) = 'int' THEN 10
       WHEN lower(C.TYPE_NAME) = 'smallint' THEN 5
       WHEN lower(C.TYPE_NAME) = 'tinyint' THEN 3
       WHEN lower(C.TYPE_NAME) = 'float' THEN 23
       WHEN lower(C.TYPE_NAME) = 'double' THEN 53
       WHEN lower(C.TYPE_NAME) like 'decimal%' THEN regexp_extract(upper(C.TYPE_NAME), '^DECIMAL\\s*\\((\\d+)',1)
       WHEN lower(C.TYPE_NAME) like 'numeric%' THEN regexp_extract(upper(C.TYPE_NAME), '^NUMERIC\\s*\\((\\d+)',1)
       ELSE null END,
  CASE WHEN lower(C.TYPE_NAME) = 'bigint' THEN 10
       WHEN lower(C.TYPE_NAME) = 'int' THEN 10
       WHEN lower(C.TYPE_NAME) = 'smallint' THEN 10
       WHEN lower(C.TYPE_NAME) = 'tinyint' THEN 10
       WHEN lower(C.TYPE_NAME) = 'float' THEN 2
       WHEN lower(C.TYPE_NAME) = 'double' THEN 2
       WHEN lower(C.TYPE_NAME) like 'decimal%' THEN 10
       WHEN lower(C.TYPE_NAME) like 'numeric%' THEN 10
       ELSE null END
FROM
  `sys`.`COLUMNS_V2` C JOIN `sys`.`SDS` S ON (C.`CD_ID` = S.`CD_ID`)
                       JOIN `sys`.`TBLS` T ON (S.`SD_ID` = T.`SD_ID`)
                       JOIN `sys`.`DBS` D ON (T.`DB_ID` = D.`DB_ID`)
                       LEFT JOIN `sys`.`TBL_COL_PRIVS` P ON (T.`TBL_ID` = P.`TBL_ID`)
WHERE
  NOT restrict_information_schema() OR P.`TBL_ID` IS NOT NULL
  AND C.`COLUMN_NAME` = P.`COLUMN_NAME`
  AND (P.`PRINCIPAL_NAME`=current_user() AND P.`PRINCIPAL_TYPE`='USER'
    OR ((array_contains(current_groups(), P.`PRINCIPAL_NAME`) OR P.`PRINCIPAL_NAME` = 'public') AND P.`PRINCIPAL_TYPE`='GROUP'))
  AND array_contains(split_map_privs(P.`TBL_COL_PRIV`),"SELECT") AND P.`AUTHORIZER`=current_authorizer();


CREATE OR REPLACE VIEW `COLUMN_PRIVILEGES`
(
  `GRANTOR`,
  `GRANTEE`,
  `TABLE_CATALOG`,
  `TABLE_SCHEMA`,
  `TABLE_NAME`,
  `COLUMN_NAME`,
  `PRIVILEGE_TYPE`,
  `IS_GRANTABLE`
) AS
SELECT DISTINCT
  P.`GRANTOR`,
  P.`PRINCIPAL_NAME`,
  'default',
  D.`NAME`,
  T.`TBL_NAME`,
  P.`COLUMN_NAME`,
  P.`TBL_COL_PRIV`,
  IF (P.`GRANT_OPTION` == 0, 'NO', 'YES')
FROM
  (SELECT
        Q.`GRANTOR`,
        Q.`GRANT_OPTION`,
        Q.`PRINCIPAL_NAME`,
        Q.`PRINCIPAL_TYPE`,
        Q.`AUTHORIZER`,
        Q.`COLUMN_NAME`,
        `TBL_COL_PRIV_TMP`.`TBL_COL_PRIV`,
        Q.`TBL_ID`
       FROM `sys`.`TBL_COL_PRIVS` AS Q
       LATERAL VIEW explode(split_map_privs(Q.`TBL_COL_PRIV`)) `TBL_COL_PRIV_TMP` AS `TBL_COL_PRIV`) P
                          JOIN `sys`.`TBLS` T ON (P.`TBL_ID` = T.`TBL_ID`)
                          JOIN `sys`.`DBS` D ON (T.`DB_ID` = D.`DB_ID`)
                          JOIN `sys`.`SDS` S ON (S.`SD_ID` = T.`SD_ID`)
                          LEFT JOIN `sys`.`TBL_PRIVS` P2 ON (P.`TBL_ID` = P2.`TBL_ID`)
WHERE
  NOT restrict_information_schema() OR P2.`TBL_ID` IS NOT NULL
  AND P.`PRINCIPAL_NAME` = P2.`PRINCIPAL_NAME` AND P.`PRINCIPAL_TYPE` = P2.`PRINCIPAL_TYPE`
  AND (P2.`PRINCIPAL_NAME`=current_user() AND P2.`PRINCIPAL_TYPE`='USER'
    OR ((array_contains(current_groups(), P2.`PRINCIPAL_NAME`) OR P2.`PRINCIPAL_NAME` = 'public') AND P2.`PRINCIPAL_TYPE`='GROUP'))
  AND P2.`TBL_PRIV`='SELECT' AND P.`AUTHORIZER`=current_authorizer() AND P2.`AUTHORIZER`=current_authorizer();

CREATE OR REPLACE VIEW SYS.CDH_VERSION AS SELECT 1 AS VER_ID, '3.1.3000.7.2.17.0-Update2' AS SCHEMA_VERSION,
                                                 'Hive release version 3.1.3000 for CDH 7.2.17.0-Update2' AS VERSION_COMMENT;

SELECT 'Finished upgrading MetaStore schema from 3.1.3000.7.2.17.0-Update1 to 3.1.3000.7.2.17.0-Update2';
