SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
SELECT	 banner
FROM	 v$version
WHERE	 rownum=1;
QUIT;
