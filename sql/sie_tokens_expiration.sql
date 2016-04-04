SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF

SELECT	 count(*)
FROM	 wit_tokens
WHERE	 sd_servicio ='&1'
AND	 f_expiracion > sysdate;

QUIT;
