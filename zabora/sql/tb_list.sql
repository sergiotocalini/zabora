SET	 pagesize 0
SET	 heading OFF
SET	 feedback OFF
SET	 verify OFF
SELECT	 TRIM(TABLESPACE_NAME)
FROM	 dba_tablespaces
WHERE	 contents not in ('UNDO','TEMPORARY');
QUIT;
