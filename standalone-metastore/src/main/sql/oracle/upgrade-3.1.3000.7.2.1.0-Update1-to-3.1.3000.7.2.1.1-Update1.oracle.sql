-- HIVE-23683
ALTER TABLE COMPACTION_QUEUE ADD CQ_ENQUEUE_TIME number(19);
ALTER TABLE COMPLETED_COMPACTIONS ADD CC_ENQUEUE_TIME number(19);

-- These lines need to be last.  Insert any changes above.
UPDATE CDH_VERSION SET SCHEMA_VERSION='3.1.3000.7.2.1.1-Update1', VERSION_COMMENT='Hive release version 3.1.3000 for CDH 7.2.1.1-Update1' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 3.1.3000.7.2.1.0-Update1 to 3.1.3000.7.2.1.1-Update1' AS Status from dual;
