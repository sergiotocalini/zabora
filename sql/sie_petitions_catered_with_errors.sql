SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF

SELECT	 count(*)
FROM	 sie.wit_peticiones
WHERE	 MN_ESTADO = 1
AND	 nn_codigoerror in (-1,-1000)
AND	 h_fecha_modificacion > SYSDATE - 2/(24*60);

QUIT;
