CREATE TEMPORARY FUNCTION dboutput AS 'org.apache.hadoop.hive.contrib.genericudf.example.GenericUDFDBOutput';

SELECT dboutput('jdbc:derby:;databaseName=${system:test.tmp.dir}/cdpd_35862;create=true', 'qtestuser', 'qtestpassword',
                'CREATE TABLE BOOK ("id" INTEGER, "title" VARCHAR(20), "author" INTEGER)');
SELECT dboutput('jdbc:derby:;databaseName=${system:test.tmp.dir}/cdpd_35862', 'qtestuser', 'qtestpassword',
                'INSERT INTO book VALUES(?,?,?)','1','Les Miserables','1');
SELECT dboutput('jdbc:derby:;databaseName=${system:test.tmp.dir}/cdpd_35862', 'qtestuser', 'qtestpassword',
                'INSERT INTO book VALUES(?,?,?)','2','The Count Of Monte','2');

CREATE EXTERNAL TABLE book
(
    id int,
    title varchar(20),
    author int
)
STORED BY                                          
'org.apache.hive.storage.jdbc.JdbcStorageHandler'
TBLPROPERTIES (                                    
    "hive.sql.database.type" = "DERBY",
    "hive.sql.jdbc.driver" = "org.apache.derby.jdbc.EmbeddedDriver",
    "hive.sql.jdbc.url" = "jdbc:derby:;databaseName=${system:test.tmp.dir}/cdpd_35862",
    "hive.sql.dbcp.username" = "qtestuser",
    "hive.sql.dbcp.password" = "qtestpassword",
    "hive.sql.table" = "BOOK",
    "hive.sql.partitionColumn" = "author",
    "hive.sql.numPartitions" = "2"
);

set hive.fetch.task.conversion=none;
select book.id from book;
