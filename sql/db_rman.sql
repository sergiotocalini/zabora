SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select trim(decode (sum(ESTADO),0,0,null,-1,1)) FROM ( 
SELECT TO_NUMBER (
            DECODE (STATUS,
                    'COMPLETED', 0,
                    'RUNNING', 0,
                    'COMPLETED WITH WARNINGS', 1,
                    'COMPLETED WITH ERRORS', 2,
                    3))
            "ESTADO",
            TO_CHAR (OPERATION)
         || '('
         || TO_CHAR (NVL (OBJECT_TYPE, '-'))
         || ') - '
         || TO_CHAR (STATUS)
         || ' - DURACION: '
         || TO_CHAR (ROUND ( (END_TIME - START_TIME) * 24 * 60, 2))
         || ' MIN'
            "DETALLE"
    FROM V$RMAN_STATUS
   WHERE START_TIME > SYSDATE -1
         AND COMMAND_ID = (  SELECT MAX (COMMAND_ID) FROM V$RMAN_STATUS)
ORDER BY ESTADO DESC, START_TIME);
QUIT;
