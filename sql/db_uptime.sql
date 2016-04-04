SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
SELECT	 to_char((sysdate-startup_time)*86400, 'FM99999999999999990') retvalue
FROM	 v$instance;
QUIT;
