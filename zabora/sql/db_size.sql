SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET      verify OFF
SELECT  to_char(sum(  NVL(a.bytes - NVL(f.bytes, 0), 0)), 'FM99999999999999990') retvalue
FROM    sys.dba_tablespaces d,
(select tablespace_name, sum(bytes) bytes from dba_data_files group by tablespace_name) a,
(select tablespace_name, sum(bytes) bytes from dba_free_space group by tablespace_name) f
WHERE   d.tablespace_name = a.tablespace_name(+)
AND     d.tablespace_name = f.tablespace_name(+)
AND NOT (d.extent_management like 'LOCAL'
AND     d.contents like 'TEMPORARY');
QUIT;
