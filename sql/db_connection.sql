SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select trim(limit_value-current_utilization) from gv$resource_limit
where resource_name='processes';
QUIT;
