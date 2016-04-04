SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
SELECT	 TRIM(TRUNC ((10000 * (x.used)) / y.mbytes) / 100)  "pct_used"
FROM	 (SELECT   b.tablespace_name NAME,
	 (SUM (b.BYTES) / COUNT (DISTINCT a.file_id || '.' || a.block_id) - SUM (DECODE (a.BYTES, NULL, 0, a.BYTES)) / COUNT (DISTINCT b.file_id)) used,
	 (SUM (DECODE (a.BYTES, NULL, 0, a.BYTES)) / COUNT (DISTINCT b.file_id)) free
FROM	 SYS.dba_data_files b, SYS.dba_free_space a
WHERE	 a.tablespace_name= UPPER('&1')
AND	 a.tablespace_name = b.tablespace_name
GROUP BY a.tablespace_name, b.tablespace_name) x,
	 (SELECT   c.tablespace_name NAME,
	 (SUM (NVL (DECODE (c.maxbytes, 0, c.BYTES, c.maxbytes),
	 c.BYTES))) mbytes
FROM	 SYS.dba_data_files c
GROUP BY c.tablespace_name) y
WHERE	 x.NAME = y.NAME;
--AND	 x.name<>'UNDOTBS1';
QUIT;
