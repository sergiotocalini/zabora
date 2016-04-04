SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF

SELECT	 count(*)
FROM	 sie.wit_peticiones
WHERE	 MN_ESTADO = 0
AND	 h_fecha_modificacion < SYSDATE - 1/(24*60);

QUIT;
