/*----------Etapa 3.2----------*/
/*1. Utiliza la tabla CLIENTES_NEPTUNO y genera una consulta que muestre las columnas IDCLIENTE 
y NOMBRECOMPANIA. En el resultado de la consulta,  se debe mostrar una nueva columna con el nombre UBICACION
que concatene las columnas DIRECCION, CIUDAD y PAIS, separando los valores de
estos campos por un guión. Para este primer ejercicio, utiliza la función CONCAT.*/
SELECT * FROM CLIENTES_NEPTUNO; 
SELECT IDCLIENTE, NOMBRECOMPANIA, CONCAT(DIRECCION, ' - ', CIUDAD, ' - ', PAIS) 
AS UBICACION FROM CLIENTES_NEPTUNO;

/*test*/
SELECT * FROM NACIMIENTOS;
SELECT sexo, fecha, tipo_parto, CONCAT(EDAD_PADRE, '_', NIVEL_PADRE, '_', OCUPA_P)
AS INFO_PADRE FROM nacimientos;

/*2. Repite el ejercicio anterior, utilizando la función CONCAT_WS.*/
SELECT IDCLIENTE, NOMBRECOMPANIA, CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) 
UBICACION FROM CLIENTES_NEPTUNO;

/*test*/
SELECT sexo, fecha, tipo_parto, CONCAT_WS('_', EDAD_PADRE, NIVEL_PADRE, OCUPA_P)
INFO_PADRE FROM nacimientos;


/*3. Modifica el ejercicio anterior para mostrar en mayúsculas los valores cargados en el 
campo NOMBRECOMPANIA. Esta columna debe mostrarse con el nombre EMPRESA.*/
SELECT IDCLIENTE, UPPER(NOMBRECOMPANIA), CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) 
UBICACION FROM CLIENTES_NEPTUNO;
/*test*/
SELECT sexo, fecha, UPPER(tipo_parto), CONCAT_WS('_', EDAD_PADRE, NIVEL_PADRE, OCUPA_P)
INFO_PADRE FROM nacimientos;

/*4. Modifica el ejercicio anterior para mostrar los valores cargados en el campo IDCLIENTE en
minúsculas. Esta columna debe mostrarse con el nombre CODIGO.*/ 
SELECT LOWER(IDCLIENTE), UPPER(NOMBRECOMPANIA), CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) 
UBICACION FROM CLIENTES_NEPTUNO;
/*test*/
SELECT LOWER(sexo) as sexo, fecha, UPPER(tipo_parto) as tipoDeParto, CONCAT_WS('_', EDAD_PADRE, NIVEL_PADRE, OCUPA_P)
INFO_PADRE FROM nacimientos;

/*5. Utiliza la tabla NACIMIENTOS y genera una consulta que muestre la columna FECHA. En
el resultado de la consulta, se debe mostrar una nueva columna con el nombre SEXO que
muestre la inicial de los datos cargados en el campo SEXO y otra columna con el nombre
TIPO que muestre la inicial de los datos cargados en el campo TIPO_PARTO.*/
SELECT FECHA, LEFT(SEXO, 1) SEXO, LEFT(TIPO_PARTO, 1) TIPO FROM nacimientos;

/*6. Utiliza la tabla CLIENTES_NEPTUNO y genera una consulta que muestre todos los campos
de la tabla. Agrega una nueva columna a la consulta con el nombre CODIGO. La misma,
debe concatenar la primera letra del campo CIUDAD y la primera y las 2 últimas letras
del campo PAIS. Los datos de esta nueva columna se deben mostrar en mayúsculas.*/
SELECT *, CONCAT(UPPER(LEFT(CIUDAD, 1)), UPPER(SUBSTRING(PAIS, 1, 1)), UPPER(SUBSTRING(PAIS, -2))) CODIGO;

/*7. Utiliza la tabla NACIMIENTOS y genera una consulta que muestre las 5 primeras columnas de la tabla.
Agrega una nueva columna a la consulta con el nombre MES que tome el mes de nacimiento de los
bebés del campo FECHA. Ordena el resultado de menor a mayor por los valores de la columna MES.*/
SELECT SUBSTRING(fecha, 4,2) AS MES FROM nacimientos ORDER BY fecha DESC;

/*8. Utiliza la tabla NACIMIENTOS y genera una consulta que muestre las siguientes columnas: SEXO, FECHA y
TIPO_PARTO. En el resultado de la consulta, se debe mostrar una nueva columna llamada NACIONALIDAD
donde se reemplazan los valores Chilena de la columna NACIONALIDAD original por Ciudadana.*/
SELECT SEXO, FECHA, TIPO_PARTO, REPLACE(NACIONALIDAD, 'Chilena', 'Ciudadana') NACIONALIDAD FROM NACIMIENTOS; 



/*----------Etapa 3.3----------*/

/*1. Utilizando la tabla PEDIDOS_NEPTUNO, obtén una lista de todos aquellos pedidos
efectuados a lo largo del año 1998.*/
SELECT * FROM PEDIDOS_NEPTUNO WHERE YEAR(FECHAPEDIDO) = 1998;

/*2. Utilizando la tabla PEDIDOS_NEPTUNO, obtén una lista de todos aquellos pedidos
efectuados durante los meses de agosto y septiembre del año 1997.*/
SELECT * FROM PEDIDOS_NEPTUNO WHERE YEAR(FECHAPEDIDO)=1997 AND (MONTH(FECHAPEDIDO)=8 OR MONTH(FECHAPEDIDO)=9);
SELECT * FROM PEDIDOS_NEPTUNO WHERE YEAR(FECHAPEDIDO)=1997 AND MONTH(FECHAPEDIDO) BETWEEN 8 AND 9;
SELECT * FROM PEDIDOS_NEPTUNO WHERE FECHAPEDIDO BETWEEN '1997-08-01' AND '1997-09-30';


/*3. Utilizando la tabla PEDIDOS_NEPTUNO, obtén una lista de todos aquellos pedidos
efectuados el primer día de cada mes de cualquier año.*/
SELECT * FROM PEDIDOS_NEPTUNO WHERE DAY(FECHAPEDIDO) = 1;
SELECT * FROM PEDIDOS_NEPTUNO WHERE DAY(FECHAPEDIDO) = 01;

/*4. Utiliza la tabla PEDIDOS_NEPTUNO y obtén una lista de todos los registros contenidos
en la tabla. En una nueva columna llamada DIAS TRANSCURRIDOS, muestra la cantidad
de días transcurridos desde la fecha en que fue realizado cada pedido, al día de hoy.*/
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS' FROM PEDIDOS_NEPTUNO;

/*5. Modifica la consulta anterior y agrega otra columna con el nombre DIA, que refleje el
nombre del día en el que se efectuó cada uno de los pedidos.*/
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', DAYNAME(FECHAPEDIDO) AS DIA FROM PEDIDOS_NEPTUNO;

/*6. Modifica la consulta anterior, agregando otra columna con el nombre DIA DEL AÑO, que
refleje el número del día del año en el que se efectuó cada uno de los pedidos.*/
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', DAYNAME(FECHAPEDIDO) AS DIA, 
DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO' FROM PEDIDOS_NEPTUNO;

/*7. Modifica la consulta anterior y agrega otra columna con el nombre MES, que refleje el
nombre del mes del año en el que se efectuó cada uno de los pedidos.*/
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', DAYNAME(FECHAPEDIDO) AS DIA, DAYOFYEAR(FECHAPEDIDO) 
AS 'DIA DEL AÑO', MONTHNAME(FECHAPEDIDO) AS 'MES' FROM PEDIDOS_NEPTUNO;

/*8. Modifica la consulta anterior y agrega otra columna llamada PRIMER VENCIMIENTO
que calcule el primer vencimiento de cada factura, suponiendo que dicho vencimiento
es a los 30 días de haber sido emitida.*/
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', DAYNAME(FECHAPEDIDO) AS DIA, DAYOFYEAR(FECHAPEDIDO) 
AS 'DIA DEL AÑO', MONTHNAME(FECHAPEDIDO) AS 'MES', ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) AS 'PRIMER VENCIMIENTO' 
FROM PEDIDOS_NEPTUNO;

/*9. Modifica la consulta anterior y agrega otra columna llamada SEGUNDO VENCIMIENTO
que calcule el segundo vencimiento de cada factura, suponiendo que dicho vencimiento es
a los 2 meses de haber sido emitida.*/
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', DAYNAME(FECHAPEDIDO) AS DIA, 
DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO', MONTHNAME(FECHAPEDIDO) AS 'MES', ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) 
AS 'PRIMER VENCIMIENTO', ADDDATE(FECHAPEDIDO, INTERVAL 2 MONTH) AS 'SEGUNDO VENCIMIENTO' FROM PEDIDOS_NEPTUNO;


/*----------Etapa 3.4----------*/

/*1. Utiliza la tabla PEDIDOS_NEPTUNO y obtén una lista de todos los registros cargados en
la tabla. Genera una nueva columna con el nombre IVA que calcule el 21% del cargo de
cada pedido, obteniendo un valor numérico que, como máximo, contenga 2 decimales.*/
SELECT *, ROUND(CARGO * 0.21, 2) AS IVA FROM PEDIDOS_NEPTUNO;

/*2. Modifica la consulta anterior, agregando una nueva columna con el nombre NETO, que
calcule el total a pagar por cada cliente por las compras realizadas (es decir, sumándole
el IVA al cargo original, manteniendo como máximo 2 decimales).*/
SELECT *, ROUND(CARGO * 0.21, 2) AS IVA, ROUND(CARGO * 1.21, 2) AS NETO FROM PEDIDOS_NEPTUNO;

/*3. Modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO A
FAVOR CLIENTE que devuelva el valor entero inferior del neto calculado anteriormente.*/
SELECT *, ROUND(CARGO * 0.21, 2) AS IVA, ROUND(CARGO * 1.21, 2) AS NETO, FLOOR(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR CLIENTE'
FROM PEDIDOS_NEPTUNO;

/*4. Modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO
A FAVOR EMPRESA que devuelva el valor entero superior del neto antes calculado.*/
SELECT *, ROUND(CARGO * 0.21, 2) AS IVA, ROUND(CARGO * 1.21, 2) AS NETO, FLOOR(ROUND(CARGO * 1.21, 2)) 
AS 'REDONDEO A FAVOR CLIENTE', CEIL(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR EMPRESA' FROM PEDIDOS_NEPTUNO;


/*----------Etapa 3.5----------*/
/*1. Calcula la cantidad de registros cargados en la tabla PEDIDOS_NEPTUNO.*/
SELECT COUNT(*) FROM PEDIDOS_NEPTUNO;
SELECT * FROM PEDIDOS_NEPTUNO;

/*2. Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido
entregados por el transportista con el nombre SPEEDY EXPRESS. La columna en la que se
obtiene el resultado debe mostrarse con el
nombre ENTREGAS SPEEDY EXPRESS.*/
SELECT COUNT(TRANSPORTISTA) AS 'ENTREGAS SPEEDY EXPRESS'
FROM PEDIDOS_NEPTUNO WHERE TRANSPORTISTA = 'SPEEDY EXPRESS';

/*3. Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido
atendidos por empleados cuyo apellido comience con la letra C. La columna en la
que se obtiene el resultado debe mostrarse con el nombre VENTAS.*/
SELECT COUNT(EMPLEADO) VENTAS FROM PEDIDOS_NEPTUNO WHERE EMPLEADO LIKE 'C%';

/*4. Calcula el precio promedio de todos los productos cargados en la tabla llamada
PRODUCTOS_NEPTUNO. La columna del resultado, debe mostrarse con el nombre
PRECIO PROMEDIO. El resultado debe mostrar, como máximo, sólo 2 decimales.*/
SELECT ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO' FROM PRODUCTOS_NEPTUNO;

/*5. Modifica la consulta anterior para obtener el precio más bajo de la tabla. La columna en
la que se obtiene el resultado debe mostrarse con el nombre PRECIO INFERIOR.*/
#SELECT ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO', MIN(PRECIOUNIDAD) 'PRECIO MINIMO' FROM PRODUCTOS_NEPTUNO;
SELECT ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO', MIN(PRECIOUNIDAD) AS 'PRECIO INFERIOR' FROM PRODUCTOS_NEPTUNO;

/*6. Modifica la consulta anterior para obtener el precio más alto de la tabla. La nueva
columna debe mostrarse con el nombre PRECIO MAXIMO.*/
#SELECT ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO', MIN(PRECIOUNIDAD) 'PRECIO MINIMO', MAX(PRECIOUNIDAD) 'PRECIO MAXIMO' FROM PRODUCTOS_NEPTUNO;
SELECT ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO', MIN(PRECIOUNIDAD) 'PRECIO INFERIOR', MAX(PRECIOUNIDAD) 'PRECIO MAXIMO' FROM PRODUCTOS_NEPTUNO;

/*7. Genera una consulta en base a la tabla PRODUCTOS_NEPTUNO que muestre el
precio más alto correspondiente a cada categoría. La columna en la que se obtiene
dicho precio debe mostrarse con el nombre PRECIO MAXIMO. La columna que muestra
las categorías debe mostrarse con el nombre CATEGORIA.*/
SELECT NOMBRECATEGORIA AS CATEGORIA, MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO' FROM PRODUCTOS_NEPTUNO GROUP BY CATEGORIA;

/*8. Calcula la cantidad de entregas efectuadas por cada transportista, utilizando la tabla
PEDIDOS_NEPTUNO. La columna en la que se obtienen los resultados debe mostrarse con
el nombre ENTREGAS.*/ 
SELECT TRANSPORTISTA, COUNT(IDPEDIDO) AS ENTREGAS FROM PEDIDOS_NEPTUNO GROUP BY TRANSPORTISTA;

/*9. Utiliza la tabla NACIMIENTOS y calcula la cantidad de nacimientos según el sexo de
los bebés. La columna en la que se obtienen los resultados debe mostrarse con el nombre
NACIMIENTOS.*/
SELECT SEXO, COUNT(SEXO) AS NACIMIENTOS FROM NACIMIENTOS GROUP BY SEXO;

/*10. Utilizando la tabla PEDIDOS_NEPTUNO, calcula el total de gastos por cliente. La
columna en la que se obtienen los resultados debe mostrarse con el nombre TOTAL
GASTOS y debe mostrar como máximo 2 decimales. La columna en la que figuran los
nombres de los clientes debe tener el título CLIENTE.*/
SELECT NOMBRECOMPANIA AS CLIENTE, ROUND(SUM(CARGO), 2) AS 'TOTAL GASTOS' FROM PEDIDOS_NEPTUNO GROUP BY CLIENTE;

/*11. Utilizando la tabla PRODUCTOS, calcula la cantidad de productos pertenecientes a cada
sección. La columna en la que se obtienen los resultados debe mostrarse con el nombre
CANTIDAD. Ordena la consulta de mayor a menor según los valores de la columna CANTIDAD.*/
SELECT SECCION, COUNT(SECCION) AS CANTIDAD FROM PRODUCTOS GROUP BY SECCION ORDER BY CANTIDAD DESC;

/*12. Utiliza la tabla PEDIDOS_NEPTUNO y calcula la cantidad de ventas efectuadas por mes y
año. Las columnas deben mostrarse con los nombres AÑO, MES y VENTAS respectivamente.
Ordena el resultado por año y mes, para obtener un listado cronológico de las ventas.*/
SELECT YEAR(FECHA_PEDIDO) 'AÑO', MONTHNAME(FECHA_PEDIDO) 'MES', COUNT(NUMERO_PEDIDO) 'VENTAS' 
FROM PEDIDOS GROUP BY AÑO, MES ORDER BY AÑO, MONTH(FECHA_PEDIDO);

/*13. Utiliza la tabla PEDIDOS_NEPTUNO y calcula las siguientes estadísticas:
a. El total facturado por empleado.
b. El promedio de facturación por empleado.
c. La mejor venta efectuada por cada empleado.
d. La peor venta efectuada por cada empleado.
e. La cantidad de ventas efectuadas por cada empleado.
f. Ten en cuenta las siguientes especificaciones:
	las columnas deben recibir los nombres FACTURACION, PROMEDIO, MEJOR VENTA, PEOR VENTA y VENTAS.
	Las columnas llamadas FACTURACION y PROMEDIO deben mostrar, como máximo, 2 decimales.*/
SELECT EMPLEADO, ROUND(SUM(CARGO), 2) AS FACTURACION, ROUND(AVG(CARGO), 2) AS PROMEDIO, MAX(CARGO) AS 'MEJOR VENTA',
MIN(CARGO) AS 'PEOR VENTA', COUNT(CARGO) AS VENTAS FROM PEDIDOS_NEPTUNO GROUP BY EMPLEADO;
