SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(*)
from dba_objects o 
where status != 'VALID'
and not exists (select 1 from dba_snapshots s where s.name = o.object_name and s.status ='VALID')
and o.object_name not like 'BIN$%'
and o.object_type <> 'SYNONYM';
QUIT;
