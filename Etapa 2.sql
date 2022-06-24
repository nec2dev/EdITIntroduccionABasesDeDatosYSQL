/*----------Etapa 2.1----------*/
/*1. Importa el archivo CSV con el nombre CLIENTES_NEPTUNO a la base de datos
con el nombre LABORATORIO:
a. Pulsa el clic derecho sobre el nombre de la base de datos LABORATORIO.
b. Selecciona Table data import wizard.
c. Pulsa el botón Browse.
d. Ubica, selecciona y abre el archivo CLIENTES_NEPTUNO.
e. Sigue los pasos del asistente.
f. Finalizado el asistente, actualiza los esquemas para verificar la importación
de la tabla.*/
#USE LABORATORIO;
#2. Lleva a cabo los cambios en la tabla CLIENTES_NEPTUNO importada anteriormente.
#ALTER TABLE CLIENTES_NEPTUNO
#MODIFY IDCLIENTE VARCHAR(5) NOT NULL PRIMARY KEY,
#MODIFY NOMBRECOMPANIA VARCHAR(100) NOT NULL,
#MODIFY PAIS VARCHAR(15) NOT NULL;

SHOW TABLES;

#3. Cambia el nombre de la tabla CLIENTES porCONTACTOS.
#RENAME TABLE CLIENTES TO CONTACTOS;

#4. Importa el archivo CSV con el nombre CLIENTES a la base de datos LABORATORIO.

#5. Lleva a cabo los siguientes cambios en la tabla CLIENTES importada anteriormente.
#ALTER TABLE CLIENTES
#MODIFY COD_CLIENTE VARCHAR(7) PRIMARY KEY, MODIFY EMPRESA VARCHAR(100) NOT NULL, MODIFY CIUDAD VARCHAR(25) NOT NULL,MODIFY TELEFONO INT UNSIGNED,MODIFY RESPONSABLE VARCHAR(30);

#6. Importa el archivo CSV con el nombre PEDIDOS a la base de datos LABORATORIO.

#7. Lleva a cabo los siguientes cambios en la tabla PEDIDOS importada anteriormente.
#DROP TABLE PEDIDOS;

/*ALTER TABLE PEDIDOS
MODIFY NUMERO_PEDIDO INT UNSIGNED PRIMARY KEY,
MODIFY CODIGO_CLIENTE VARCHAR(7) NOT NULL,
MODIFY FECHA_PEDIDO DATE NOT NULL,
MODIFY FORMA_PAGO ENUM('CONTADO', 'APLAZADO', 'TARJETA'),
MODIFY ENVIADO ENUM ('SI', 'NO');*/

#SELECT * FROM PEDIDOS;

#8. Importa el archivo CSV con el nombre PRODUCTOS a la base de datos LABORATORIO.

#9. Lleva a cabo los cambios en la tabla PRODUCTOS importada en el paso anterior.
/*ALTER TABLE PRODUCTOS
MODIFY COD_PRODUCTO INT UNSIGNED PRIMARY KEY,
MODIFY SECCION VARCHAR(20) NOT NULL,
MODIFY NOMBRE VARCHAR(40) NOT NULL,
MODIFY IMPORTADO ENUM('VERDADERO', 'FALSO') NOT NULL,
MODIFY ORIGEN VARCHAR(25) NOT NULL,
MODIFY DIA INT UNSIGNED NOT NULL, MODIFY MES INT UNSIGNED NOT NULL, MODIFY ANO INT UNSIGNED NOT NULL;*/

#SELECT * FROM PRODUCTOS;

/*----------Etapa 2.2----------*/
/*1. Abre el archivo con formato SQL con el nombre NACIMIENTOS desde MySQL Workbench:
a. Ejecuta el comando File Open SQL Script.
b. Ubica, selecciona y abre el archivo NACIMIENTOS.
2. Ejecuta el código.
3. Actualiza los esquemas.
4. Abre el archivo con formato SQL con el nombre PEDIDOS_NEPTUNO desde MySQL Workbench:
a. Ejecuta el comando File Open SQL Script.
b. Ubica, selecciona y abre el archivo PEDIDOS_NEPTUNO.
5. Ejecuta el código y actualiza los esquemas.
6. Abre el archivo con formato SQL con el nombre
TABLAS_EXTRAS desde MySQL Workbench:
a. Ejecuta el comando File Open SQL Script.
b. Ubica, selecciona y abre el archivo TABLAS_EXTRAS.
7. Ejecuta el código.
8. Actualiza los esquemas.
9. Cierra los scripts con los nombres NACIMIENTOS, PEDIDOS NEPTUNO y TABLAS EXTRAS.*/

/*----------Etapa 2.3----------*/
/*1. Muestra todo el contenido de la tabla CLIENTES_NEPTUNO importada en el
laboratorio anterior.*/
#SELECT * FROM CLIENTES_NEPTUNO;

/*2. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.*/
#SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO;

/*3. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de
la consulta, sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD
y PAIS. Ordena alfabéticamente el resultado de la consulta, por los nombres de los países.*/
#SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO ORDER BY PAIS;

/*4. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS. Ordena
el resultado de la consulta alfabéticamente por los nombres de los países. Para aquellos países que
se repiten, ordena las ciudades alfabéticamente.*/
#SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO ORDER BY PAIS, CIUDAD;

/*5. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordena de manera alfabética el resultado de la consulta, por los nombres de los países.
Muestra únicamente los 10 primeros clientes.*/
#SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO ORDER BY PAIS LIMIT 10;

/*6. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordena de manera alfabética el resultado de la consulta, por los nombres de los países.
Muestra únicamente los clientes ubicados desde la posición 11 hasta la 15.*/
#SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO ORDER BY PAIS, CIUDAD LIMIT 5 OFFSET 10;

/*----------Etapa 2.4----------*/
/*1. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres
extranjeras. Muestra todos los campos de la tabla en el resultado de la consulta.*/
#SELECT * FROM NACIMIENTOS WHERE NACIONALIDAD = 'EXTRANJERA';

/*2. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres menores de edad.
Muestra todos los campos de la tabla en el resultado de la consulta y ordena el resultado de menor a mayor
por la edad de las madres.*/
#SELECT * FROM NACIMIENTOS WHERE EDAD_MADRE < 18 ORDER BY EDAD_MADRE;

/*3. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres que tengan la
misma edad que el padre. Muestra todos los campos de la tabla en el resultado de la consulta.*/
#SELECT * FROM NACIMIENTOS WHERE EDAD_MADRE = EDAD_PADRE;

/*4. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres que, con respecto
al padre, tengan 40 años o menos que el padre.
#SELECT * FROM NACIMIENTOS WHERE EDAD_PADRE-EDAD_MADRE > 40;*/

/*5. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes que residen en Argentina.
Muestra todos los campos de la tabla en el resultado de la consulta.*/
#SELECT * FROM CLIENTES_NEPTUNO WHERE PAIS = 'ARGENTINA';

/*6. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos los clientes, con excepción de los que residen en
Argentina. Muestra todos los campos de la tabla en el resultado de la consulta y ordena alfabéticamente
dicho resultado por los nombres de los países.*/
#SELECT * FROM CLIENTES_NEPTUNO WHERE PAIS <> 'ARGENTINA' ORDER BY PAIS;

/*7. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés que nacieron con menos de 20 semanas
de gestación. Muestra todos los campos de la tabla en el resultado de la consulta y ordena dicho
resultado de mayor a menor, por los valores de la columna SEMANAS.*/
#SELECT * FROM NACIMIENTOS WHERE SEMANAS < 20 ORDER BY SEMANAS DESC;

/*8. De la tabla NACIMIENTOS, obtén una lista de todos los bebés de sexo femenino, nacidos de madres
extranjeras solteras, de más de 40 años. Muestra todos los campos de la tabla en el resultado de la
consulta.*/
/*SELECT * FROM NACIMIENTOS WHERE SEXO = 'FEMENINO' AND NACIONALIDAD = 'EXTRANJERA' AND ESTADO_CIVIL_MADRE = 'SOLTERA'
AND EDAD_MADRE > 40;*/

/*9. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes que residan en países
sudamericanos. (Los países sudamericanos que figuran en esta tabla son
Argentina, Brasil y Venezuela). Muestra todos los campos de la tabla en el resultado
de la consulta y ordena de manera alfabética los registros, por los nombres de los países y las ciudades.*/
#SELECT * FROM CLIENTES_NEPTUNO WHERE PAIS = 'ARGENTINA' OR PAIS = 'VENEZUELA' OR PAIS = 'BRASIL' ORDER BY PAIS, CIUDAD;

/*10. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés que hayan nacido con una cantidad de
semanas de gestación de entre 20 y 25 semanas, inclusive. Muestra todos los campos de la tabla en el
resultado de la consulta y ordena el resultado según las semanas de gestación de los recién nacidos, de menor
a mayor.*/
#SELECT * FROM NACIMIENTOS WHERE SEMANAS BETWEEN 20 AND 25 ORDER BY SEMANAS;

/*11. De la tabla NACIMIENTOS, utiliza el operador IN y obtén una lista de todos aquellos bebés que nacieron
en las comunas 1101, 3201, 5605, 8108, 9204, 13120 y 15202. Muestra todos los campos de la tabla en el
resultado de la consulta y ordena de menor a mayor los registros, por los números de comuna.*/
/*SELECT * FROM NACIMIENTOS WHERE COMUNA IN (1101, 3201, 5605, 8108, 9204, 13120, 15202)
ORDER BY COMUNA;*/

/*12. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes cuyo ID comience con
la letra C. Muestra todos los campos de la tabla, en el resultado de la consulta.*/
#SELECT * FROM CLIENTES_NEPTUNO WHERE IDCLIENTE LIKE 'C%';

/*13. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes que residan en una ciudad que
comience con la letra B y en total posea 5 caracteres. Muestra todos los campos de la tabla en el resultado
de la consulta.*/
#SELECT * FROM CLIENTES_NEPTUNO WHERE CIUDAD LIKE 'B____';

#14. De la tabla NACIMIENTOS, obtén una lista de todos aquellos padres que tengan más de 10 hijos.
#SELECT * FROM NACIMIENTOS WHERE HIJOS_TOTAL > 10;

