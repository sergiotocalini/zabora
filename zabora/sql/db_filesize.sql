SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
SELECT	 to_char(sum(bytes), 'FM99999999999999990') retvalue
FROM	 dba_data_files;
QUIT;
