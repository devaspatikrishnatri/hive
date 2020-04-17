set hive.support.concurrency=true;
set hive.txn.manager=org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;

create table t1(a int, b varchar(256), c decimal(10,2)) stored as orc TBLPROPERTIES ('transactional'='true');
create table t2(a int, b varchar(256), c decimal(10,2)) stored as orc TBLPROPERTIES ('transactional'='true');

insert into t1 values (1, 'alfred', 10.30),(2, 'bob', 3.14),(2, 'bonnie', 172342.2),(3, 'calvin', 978.76),(3, 'charlie', 9.8);
insert into t2 values (3, 'calvin', 978.76),(3, 'charlie', 9.8);

create materialized view mat1 as
select t1.a, t1.b, t1.c from t1
left outer join t2 on t1.a = t2.a;

describe formatted mat1;
