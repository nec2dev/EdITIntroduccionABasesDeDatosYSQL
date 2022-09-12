/*----------Etapa 4.1----------*/
/*1. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre VARONES
con todos los campos de la tabla original y copia en esta nueva tabla todos los registros
en los que figure el sexo MASCULINO. Al ejecutar la consulta, debería generarse la
tabla con 98.397 filas. No olvidar actualizar los esquemas para verificar la creación de
la tabla dentro de la base de datos.*/
SET SQL_SAFE_UPDATES = 0;
CREATE TABLE VARONES SELECT * FROM nacimientos WHERE SEXO = "Masculino";
SHOW TABLES;
DESC varones;
SELECT * FROM varones;

/*2. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre MUJERES con
todos los campos de la tabla original y copiar en esta nueva tabla todos los registros en los
que figure el sexo FEMENINO. Al ejecutar la consulta, debería generarse la tabla con
94.763 filas. Actualizar los esquemas para verificar la creación de la tabla dentro de la
base de datos.*/
CREATE TABLE MUJERES SELECT * FROM nacimientos WHERE SEXO = "Femenino";
SHOW TABLES;
DESC mujeres;
SELECT * FROM mujeres;


/*3. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre INDETERMINADOS con todos los
campos de la tabla original y copiar en esta nueva tabla todos los registros en los que figure el sexo
INDETERMINADO. Al ejecutar la consulta, debería generarse la tabla con 24 filas. No olvidar actualizar
los esquemas para verificar la creación de la tabla dentro de la base de datos.*/
CREATE TABLE INDETERMINADOS SELECT * FROM nacimientos WHERE SEXO = "Indeterminado";
SHOW TABLES;
DESC indeterminados;
SELECT * FROM indeterminados;

#4. Eliminar la tabla NACIMIENTOS.
DROP TABLE nacimientos;

/*----------Etapa 4.2----------*/
/*1. Actualizar la tabla CLIENTES_NEPTUNO. Cuando figure el valor ESTADOS UNIDOS en
el campo PAIS, cambiar dicho valor por USA. Para verificar el cambio realizado, mostrar el
contenido de la tabla CLIENTES_NEPTUNO.*/
DESC clientes_neptuno;
SELECT * FROM clientes_neptuno;
/*Probado con exito, pero no recomendado*/
UPDATE clientes_neptuno SET PAIS = 'USA' WHERE PAIS LIKE 'Estados Unidos';
/*recomendado*/
UPDATE clientes_neptuno SET PAIS = 'USA' WHERE PAIS = 'Estados Unidos';

/*2. Actualizar la tabla CLIENTES_NEPTUNO para mostrar todos los valores del campo
NOMBRECOMPANIA en mayúsculas. Para verificar el cambio realizado, mostrar el
contenido de la tabla CLIENTES_NEPTUNO.*/
UPDATE clientes_neptuno SET NombreCompania = UPPER(NombreCompania);
SELECT * FROM clientes_neptuno;

/*3. Actualizar la tabla CLIENTES_NEPTUNO para mostrar todos los valores de los campos
CIUDAD y PAIS en mayúsculas. Mostrar el contenido de la tabla CLIENTES_NEPTUNO
para verificar el cambio llevado a cabo.*/
UPDATE clientes_neptuno SET Ciudad = UPPER(Ciudad), Pais = UPPER(Pais);
SELECT * FROM clientes_neptuno;

/*4. En la tabla EMPLEADOS generar una nueva columna llamada NOMBRE_EMPLEADO
que admita cadenas de texto con un máximo de 30 caracteres. Ubica esta columna a la
derecha del campo IDEMPLEADO. Completar esta nueva columna concatenando los
valores cargados en los campos APELLIDOS y NOMBRE, separando dichos valores por
una coma y un espacio. Eliminar las columnas APELLIDOS y NOMBRE. Mostrar el
contenido de la tabla EMPLEADOS para verificar el cambio llevado a cabo.*/
SELECT * FROM empleados;
ALTER TABLE empleados ADD nombre_empleado VARCHAR(30) AFTER IdEmpleado;
UPDATE empleados SET nombre_empleado = CONCAT(Apellidos, ', ', Nombre);
ALTER TABLE empleados DROP Apellidos, DROP Nombre; 

/*5. En la tabla CLIENTES generar una nueva columna con el nombre TIPO que admita
cadenas de texto con un máximo de 3 caracteres. Esta columna debe ubicarse
al final de la tabla. Completar esta nueva columna estableciendo el valor VIP para
todos aquellos clientes que residan en la ciudad de MADRID. Para verificar el cambio
llevado a cabo, mostrar el contenido de la tabla CLIENTES.*/
SELECT * FROM clientes;
ALTER TABLE clientes ADD tipo VARCHAR(3);
UPDATE clientes SET tipo = 'VIP' WHERE Ciudad = "MADRID";

/*6. Dado que todos los clientes que figuran en la tabla CLIENTES residen en España, agregar
el prefijo +34- a cada uno de los teléfonos que figuran en el campo TELEFONO. En caso
de que un cliente no tuviera el teléfono cargado, a ese teléfono no se le debería
agregar el prefijo. Mostrar el contenido de la tabla CLIENTES para verificar el cambio
realizado.*/
DESCRIBE clientes;
/*Atención: este campo es de tipo INT, por lo tanto, no admitirá el agregado del prefijo, tal como se
especifica en el ejercicio. Deberás cambiar el tipo de dato de este campo.*/
ALTER TABLE clientes MODIFY telefono VARCHAR(14);
/*Creamos caso de NULL*/
UPDATE clientes SET telefono = NULL WHERE Cod_Cliente = 'CT01';
/*Creamos caso de String vacio*/
UPDATE clientes SET telefono = '' WHERE Cod_Cliente = 'CT02';
/*Esta query funciona para los casos de String vacio y de NULL*/
UPDATE clientes SET telefono = CONCAT('+34-', telefono) WHERE telefono <> '';
/*UPDATE clientes SET telefono = CONCAT('+34-', telefono) WHERE telefono IS NOT NULL;*/
/*UPDATE clientes SET telefono = CONCAT('+34-', telefono) WHERE telefono <> '' AND telefono IS NOT NULL;*/


/*7. En la tabla PRODUCTOS generar una nueva columna con el nombre FECHA que admita la
carga de fechas. Completar la nueva columna con fechas coherentes, concatenando los
campos DIA, MES y ANO. Cargados los datos en la nueva columna, eliminar las columnas
originales (DIA, MES y ANO). Además, actualizar el campo ORIGEN de manera que,
donde figure el valor ESPANA, sea reemplazado por ESPAÑA. Devolver el contenido de la
tabla PRODUCTOS para verificar el cambio llevado a cabo.*/
ALTER TABLE productos ADD fecha DATE;
UPDATE productos SET fecha = CONCAT_WS('-', ano,  mes, dia);
ALTER TABLE productos DROP ano, DROP mes, DROP dia;
UPDATE productos SET origen = 'ESPAÑA' WHERE origen = 'ESPANA';
SELECT * FROM productos;

/*8. Actualizar el campo SUSPENDIDO de la tabla PRODUCTOS_NEPTUNO de manera que:
a. Donde figure el valor 0, éste se reemplace por la palabra NO.
b. Donde figure el valor 1, éste se reemplace por la palabra SI.
c. Tener en cuenta que el campo SUSPENDIDO es de tipo INT actualmente. Cambiar el tipo de dato para
que admita el reemplazo.
d. Para verificar el cambio llevado a cabo, mostrar el contenido de la tabla PRODUCTOS_NEPTUNO*/
SELECT * FROM productos_neptuno;
DESCRIBE productos_neptuno;
ALTER TABLE productos_neptuno MODIFY Suspendido VARCHAR(2);
/*Forma de hacerlo con dos queries filtrando*/
UPDATE productos_neptuno SET Suspendido = 'SI' WHERE Suspendido = '1';
UPDATE productos_neptuno SET Suspendido = 'NO' WHERE Suspendido = '0';
/*Forma de hacerlo con if*/
UPDATE productos_neptuno SET Suspendido = IF(Suspendido = 1, 'SI', 'NO');

/*9. Actualizar los precios de todos los productos de la tabla PRODUCTOS_NEPTUNO,
recargándolos un 10% y manteniendo un total de 2 decimales para cada uno de los
precios. Mostrar el contenido de la tabla PRODUCTOS_NEPTUNO para verificar el
cambio llevado a cabo.*/
SELECT * FROM productos_neptuno;
UPDATE productos_neptuno SET PrecioUnidad = ROUND(PrecioUnidad*1.1 ,2);

/*10. Observar la tabla PROVEEDORES y su contenido. Para todos aquellos proveedores
que no tengan cargado un valor en el campo REGION, mostrar el valor NULL en dicho
campo. Mostrar el contenido de la tabla PROVEEDORES para verificar el cambio
llevado a cabo.*/
SELECT * FROM proveedores;
UPDATE proveedores SET Region = NULL WHERE Region = ''; 

/*11. Observar el contenido de la tabla CLIENTES. Actualizar el campo CIUDAD de manera que
todos los valores cargados en esta columna muestren la primera letra en mayúsculas y el
resto en minúsculas. Mostrar el contenido de la tabla PROVEEDORES para verificar el
cambio llevado a cabo.*/
SELECT * FROM clientes;
DESC clientes;
UPDATE clientes SET ciudad = CONCAT(LEFT(ciudad, 1), LOWER(SUBSTRING(Ciudad, 2, 25)));

/*12. Generar una nueva tabla con el nombre PRODUCTOS_SUSPENDIDOS a partir de la tabla
PRODUCTOS_NEPTUNO. Volcar en esta nueva tabla todos los campos de la tabla PRODUCTOS_NEPTUNO,
pero sólo aquellos registros en los que en el campo SUSPENDIDO figure la palabra SI. Mostrar el
contenido de la tabla PRODUCTOS_SUSPENDIDOS una vez generada. La nueva tabla debería contener 8
productos (registros).*/


/*----------Etapa 4.3----------*/
/*1. Desde ahora, todos los productos provistos por el proveedor 1 pasan a estar suspendidos
por tiempo indeterminado. Por lo tanto:*/
/*a. Ejecutar una consulta de actualización por la que, todos los productos de la tabla
PRODUCTOS_NEPTUNO que pertenecen al proveedor cuyo IDPROVEEDOR sea el
número 1 pasen a mostrar el valor SI en el campo SUSPENDIDO.*/


/*b. Ejecutar una consulta de datos anexados por la que, todos los productos que ahora
se encuentran suspendidos en la tabla PRODUCTOS_NEPTUNO se copien en
la tabla PRODUCTOS_SUSPENDIDOS.*/


/*c. Ejecutar una consulta de eliminación por la que, todos los productos de la tabla
PRODUCTOS_NEPTUNO que fueron copiados, se eliminen de la tabla PRODUCTOS_SUSPENDIDOS.*/


/*----------Etapa 4.4----------*/
/*1. En la etapa anterior, se creó una tabla nueva con el nombre PRODUCTOS_SUSPENDIDOS
y se copió en ella, todos los productos que se encontraban suspendidos de la tabla
PRODUCTOS_NEPTUNO. Sin embargo, estos registros se copiaron de una tabla a la otra;
es decir, aún se encuentran cargados en la tabla PRODUCTOS_NEPTUNO.
Por lo tanto, llevar a cabo una consulta de eliminación por la que los productos
suspendidos se eliminen de la tabla PRODUCTOS_NEPTUNO. Al ejecutar esta
consulta deberían eliminarse de la tabla PRODUCTOS_NEPTUNO 8 registros.*/





