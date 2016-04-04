SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select      CASE METRIC_NAME
            WHEN 'SQL Service Response Time' then ROUND((AVERAGE / 100),2)
            WHEN 'Response Time Per Txn' then ROUND((AVERAGE / 100),2)
            ELSE AVERAGE
            END AVERAGE
from    SYS.V_$SYSMETRIC_SUMMARY 
where   METRIC_NAME in ('&1');
QUIT;
