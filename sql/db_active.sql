SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET      verify OFF
SELECT	 to_char(case when inst_cnt > 0 then 1 else 0 end,'FM99999999999999990') retvalue
FROM	 (select count(*) inst_cnt FROM v$instance 
WHERE	 status = 'OPEN' AND logins = 'ALLOWED' AND database_status = 'ACTIVE');
QUIT;
