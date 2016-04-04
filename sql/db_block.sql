SET      pagesize 0

SET      heading OFF

SET      feedback OFF

SET	 verify OFF
select count(*) 
from gv$session_blockers a, v$session v
where a.blocker_sid=v.sid
and v.username is not null
and exists(select 1 from v$session v2
           where a.sid=v2.sid and v2.username is not null and SECONDS_IN_WAIT/60>=1);
QUIT;
