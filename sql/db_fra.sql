SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET      verify OFF
select case when cant =0 then 0
            else (select decode( nvl( space_used, 0), 0, 0 , ceil ( ( ( space_used - space_reclaimable ) / space_limit) * 100) )
from v$recovery_file_dest) end
from ( select count(*) cant from v$recovery_file_dest);
QUIT;
