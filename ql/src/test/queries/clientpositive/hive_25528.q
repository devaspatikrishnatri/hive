--! qt:dataset:src

 CREATE TABLE default.`dwd_fib_bond_info_di`(    
   `issue_prc` decimal(28,4) ,
   `per_100y_acr_int_fc` decimal(28,8) ) 
 PARTITIONED BY (
   `p_dt` string) ;

insert into default.dwd_fib_bond_info_di values (100.0, 6.443, 'hello');


explain cbo select issue_prc, per_100y_acr_int_fc, issue_prc/per_100y_acr_int_fc as total_int from default.dwd_fib_bond_info_di where p_dt='20220512' and issue_prc is not null and per_100y_acr_int_fc is not null and per_100y_acr_int_fc=6.44300000 order by total_int limit 3;

explain cbo select issue_prc, per_100y_acr_int_fc, issue_prc/per_100y_acr_int_fc as total_int from default.dwd_fib_bond_info_di where p_dt='20220512' and issue_prc is not null and per_100y_acr_int_fc is not null and per_100y_acr_int_fc!=6.44300000 order by total_int limit 3;


select issue_prc, per_100y_acr_int_fc, issue_prc/per_100y_acr_int_fc as total_int from default.dwd_fib_bond_info_di where issue_prc is not null and per_100y_acr_int_fc is not null and per_100y_acr_int_fc=6.44300000 order by total_int limit 3;

select issue_prc, per_100y_acr_int_fc, issue_prc/per_100y_acr_int_fc as total_int from default.dwd_fib_bond_info_di where issue_prc is not null and per_100y_acr_int_fc is not null and per_100y_acr_int_fc!=0.00000000 order by total_int limit 3;

