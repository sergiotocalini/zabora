SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(*)
from gv$log_history
where to_char(first_time,'YYYY-MM-DD HH24')= to_char(sysdate,'YYYY-MM-DD HH24');
QUIT;
