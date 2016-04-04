SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select COUNT(*)  from v$session  ,DBA_WAITERS   
where Seconds_in_wait/60>=1 
AND STATE='WAITING' 
AND SID=HOLDING_SESSION;
QUIT;
