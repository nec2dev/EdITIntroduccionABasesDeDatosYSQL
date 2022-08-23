#<-------------Etapa 2.1.1------------->
/*1. Importar el archivo CSV con el nombre CLIENTES_NEPTUNO (éste se encuentra 
disponible en el área de descargas, del presente módulo) a la base de datos con el 
nombre LABORATORIO. Y tener en cuenta las siguientes indicaciones:
a. No cambiar el nombre de la tabla.
b. Eliminar la tabla en el caso de que ya exista dentro de la base de datos.
c. Mantener los tipos de datos asignados al momento de la importación.*/
USE laboratorio;
SHOW TABLES;
DESC clientes_neptuno;
SELECT * FROM clientes_neptuno;

#<-------------Etapa 2.1.2------------->
/*2. Llevar a cabo los siguientes cambios en la tabla CLIENTES_NEPTUNO importada anteriormente. 
Respetar las consignas detalladas a continuación y utilizar el comando ALTER TABLE:
a. Campo IDCliente: debe ser de tipo VARCHAR, debe admitir hasta 5 caracteres como máximo y debe ser el campo 
PRIMARY KEY de la tabla.
b. Campo NombreCompania: debe ser de tipo VARCHAR, debe admitir hasta 100 caracteres como máximo y no puede 
quedar vacío.
c. Campo Pais: debe ser de tipo VARCHAR, debe admitir hasta 15 caracteres como 
máximo y no puede quedar vacío.*/
ALTER TABLE clientes_neptuno
	MODIFY IDCliente VARCHAR(5) PRIMARY KEY,
    MODIFY NombreCompania VARCHAR(100) NOT NULL,
    MODIFY Pais VARCHAR(15) NOT NULL;
DESC clientes_neptuno;

#<-------------Etapa 2.1.3------------->
/*3. Cambiar el nombre de la tabla CLIENTES por 
CONTACTOS.*/
RENAME TABLE clientes TO contactos;
SHOW TABLES;

#<-------------Etapa 2.1.4------------->
/*4. Importar el archivo CSV con el nombre CLIENTES a la base de 
datos LABORATORIO. Y tener en cuenta las siguientes indicaciones:
a. Este archivo lo encontrarás disponible en el 
área de descargas del presente módulo.
b. No cambiar el nombre de la tabla.
c. Mantener los tipos de datos asignados al 
momento de la importación*/
DESC clientes;
SELECT * FROM clientes;

#<-------------Etapa 2.1.5------------->
/*5. Llevar a cabo los siguientes cambios en la  tabla CLIENTES importada anteriormente. 
Respetar las consignas detalladas a continuación y utiliza el comando ALTER TABLE:
a. Campo Cod_Cliente: debe ser de tipo VARCHAR, debe admitir hasta 7 caracteres como 
máximo y debe ser el campo PRIMARY KEY de la tabla.
b. Campo Empresa: debe ser de tipo VARCHAR, debe admitir hasta 100 caracteres como máximo 
y no puede quedar vacío.
c. Campo Ciudad: debe ser de tipo VARCHAR, debe admitir hasta 25 caracteres como máximo y 
no puede quedar vacío.
d. Campo Telefono: debe ser de tipo INT y no debe admitir valores numéricos negativos.
e. Campo Responsable: debe ser de tipo VARCHAR y debe admitir como máximo hasta 30 caracteres*/
ALTER TABLE clientes
	MODIFY Cod_Cliente VARCHAR(7) PRIMARY KEY,
    MODIFY empresa VARCHAR(100) NOT NULL,
    MODIFY ciudad VARCHAR(25) NOT NULL,
    MODIFY telefono INT UNSIGNED,
    MODIFY responsable VARCHAR(30);
DESC clientes;

#<-------------Etapa 2.1.6------------->
/*6. Importar el archivo CSV con el nombre 
PEDIDOS a la base de datos LABORATORIO. 
Y tener en cuenta las siguientes indicaciones:
a. Este archivo lo encontrarás disponible en el área de descargas del presente módulo.
b. No cambiar el nombre de la tabla.
c. Mantener los tipos de datos asignados al momento de la importación.*/
DESC pedidos;

#<-------------Etapa 2.1.7------------->
/*7. Llevar a cabo los siguientes cambios en la 
tabla PEDIDOS importada anteriormente. 
Respetar las consignas detalladas a continuación y utilizar el comando ALTER TABLE:
a. Campo Numero_Pedido: debe ser de tipo INT, sólo debe aceptar valores numéricos 
positivos y debe ser el campo PRIMARY KEY de la tabla.
b. Campo Codigo_Cliente: debe ser de tipo VARCHAR, debe admitir hasta 7 caracteres 
como máximo y no puede quedar vacío.
c. Campo Fecha_Pedido: debe ser de tipo DATE y su carga es obligatoria.
d. Campo Forma_Pago: sólo debe admitir la carga de los valores APLAZADO, CONTADO o TARJETA.
e. Campo Enviado: sólo debe admitir la carga de los valores SI o NO.*/
ALTER TABLE pedidos
	MODIFY numero_pedido INT UNSIGNED PRIMARY KEY,
    MODIFY codigo_cliente VARCHAR(7) NOT NULL,
    MODIFY fecha_pedido DATE NOT NULL,
    MODIFY forma_pago ENUM('APLAZADO', 'CONTADO', 'TARJETA'),
    MODIFY enviado ENUM('SI','NO');
    
#Pruebas
/*ALTER TABLE pedidos MODIFY forma_pago ENUM('APLAZADO', 'CONTADO', 'TARJETA') NOT NULL;
ALTER TABLE pedidos MODIFY forma_pago ENUM('APLAZADO', 'CONTADO', 'TARJETA');
DESC pedidos;
INSERT INTO pedidos VALUES (99999, 'ABC123Z', '2022-08-08', 'BARRANI', 'SI');
INSERT INTO pedidos VALUES (88888, 'ABC123Z', '2022-08-08', 'TARJETA', 'NO');
INSERT INTO pedidos VALUES (77777, 'ABC123Z', '2022-08-08', 'BARRANI', 'SI');
INSERT INTO pedidos VALUES (66666, 'ABC123Z', '2022-08-08', '', 'SI');
SELECT * FROM pedidos;*/
 
 #<-------------Etapa 2.1.8------------->
/*8. Importar el archivo CSV: PRODUCTOS a la base de datos LABORATORIO. Y tener en 
cuenta las siguientes indicaciones:
a. Este archivo lo encontrarás disponible en  el área de descargas del presente módulo.
b. No cambiar el nombre de la tabla.
c. Mantener los tipos de datos asignados al momento de la importación.*/
DESC productos;

#<-------------Etapa 2.1.9------------->
/*9. Llevar a cabo los siguientes cambios en la tabla PRODUCTOS importada en el paso 
anterior. Respetar las consignas detalladas a continuación, utilizando el comando ALTER 
TABLE:
a. Campo Cod_Producto: debe ser de tipo INT, sólo debe aceptar valores numéricos 
positivos y debe ser el campo PRIMARY KEY de la tabla.
b. Campo Seccion: debe ser de tipo VARCHAR, debe admitir hasta 20 caracteres como máximo y no puede 
quedar vacío.
c. Campo Nombre: debe ser de tipo VARCHAR, debe admitir hasta 40 caracteres como máximo y no 
puede quedar vacío. 
d. Campo Importado: sólo debe admitir la carga de los valores VERDADERO o FALSO.
e. Campo Origen: debe ser de tipo VARCHAR, admitir hasta 25 caracteres y ser de carga obligatoria.
f. Campos Dia, Mes y Ano: deben ser de tipo INT, positivos y de carga obligatoria.*/
ALTER TABLE productos
	MODIFY cod_producto INT UNSIGNED PRIMARY KEY,
    MODIFY seccion VARCHAR(20) NOT NULL,
    MODIFY nombre VARCHAR(40) NOT NULL,
    MODIFY importado ENUM('VERDADERO', 'FALSO'),
    MODIFY origen VARCHAR(25) NOT NULL,
    MODIFY dia INT UNSIGNED NOT NULL,
    MODIFY mes INT UNSIGNED NOT NULL,
    MODIFY ano INT UNSIGNED NOT NULL;
    
ALTER TABLE productos MODIFY mes INT UNSIGNED NOT NULL;
DESC productos;

#<-------------Etapa 2.2------------->
/*1. Abre el archivo con formato SQL con el nombre
NACIMIENTOS desde MySQL Workbench:*/
#a. Ejecuta el comando File Open SQL Script.
#b. Ubica, selecciona y abre el archivo NACIMIENTOS.
/*2. Ejecuta el código.
3. Actualiza los esquemas.*/
/*4. Abre el archivo con formato SQL con el nombre
PEDIDOS_NEPTUNO desde MySQL Workbench:
a. Ejecuta el comando File Open SQL Script.
b. Ubica, selecciona y abre el archivo PEDIDOS_NEPTUNO.*/
#5. Ejecuta el código y actualiza los esquemas.
/*6. Abre el archivo con formato SQL con el nombre
TABLAS_EXTRAS desde MySQL Workbench:
a. Ejecuta el comando File Open SQL Script.
b. Ubica, selecciona y abre el archivo
TABLAS_EXTRAS.*/
/*7. Ejecuta el código.*/
/*8. Actualiza los esquemas.*/
/*9. Cierra los scripts con los nombres NACIMIENTOS,
PEDIDOS NEPTUNO y TABLAS EXTRAS.*/

SELECT * FROM nacimientos;
SELECT * FROM pedidos_neptuno;
SELECT * FROM empleados;
SELECT * FROM productos_neptuno;
SELECT * FROM proveedores;

#<-------------Etapa 2.3------------->
/*1. Muestra todo el contenido de la tabla
CLIENTES_NEPTUNO importada en el
laboratorio anterior.*/
SELECT * FROM clientes_neptuno;

/*2. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.*/
SELECT nombrecompania, ciudad, pais FROM clientes_neptuno;

/*3. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de
la consulta, sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD
y PAIS. Ordena alfabéticamente el resultado de la consulta, por los nombres de los países.*/
SELECT nombrecompania, ciudad, pais FROM clientes_neptuno ORDER BY pais;

/*4. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS. Ordena
el resultado de la consulta alfabéticamente por los nombres de los países. Para aquellos países que
se repiten, ordena las ciudades alfabéticamente.*/
SELECT nombrecompania, ciudad, pais FROM clientes_neptuno ORDER BY pais, ciudad;

/*5. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordena de manera alfabética el resultado de la consulta, por los nombres de los países.
Muestra únicamente los 10 primeros clientes.*/
SELECT nombrecompania, ciudad, pais FROM clientes_neptuno ORDER BY pais LIMIT 10;

/*6. Muestra todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordena de manera alfabética el resultado de la consulta, por los nombres de los países.
Muestra únicamente los clientes ubicados desde la posición 11 hasta la 15.*/
SELECT nombrecompania, ciudad, pais FROM clientes_neptuno ORDER BY pais LIMIT 5 OFFSET 10;


#<-------------Etapa 2.4------------->
/*1. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres
extranjeras. Muestra todos los campos de la tabla en el resultado de la consulta.*/
SHOW TABLES;
DESC nacimientos;
SELECT * FROM nacimientos;
SELECT * FROM nacimientos WHERE nacionalidad = 'Extranjera';

/*2. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres menores de edad.
Muestra todos los campos de la tabla en el resultado de la consulta y ordena el resultado de menor a mayor
por la edad de las madres.*/
SELECT * FROM nacimientos WHERE edad_madre < 18 ORDER BY edad_madre;

/*3. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres que tengan la
misma edad que el padre. Muestra todos los campos de la tabla en el resultado de la consulta.*/
SELECT * FROM nacimientos WHERE edad_madre = edad_padre;

/*4. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés nacidos de madres que, con respecto
al padre, tengan 40 años o mas que el padre.*/
SELECT * FROM nacimientos WHERE edad_padre - edad_madre > 40;

/*5. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes que residen en Argentina.
Muestra todos los campos de la tabla en el resultado de la consulta.*/
SELECT * FROM clientes_neptuno WHERE pais = 'Argentina';

/*6. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos los clientes, con excepción de los que residen en
Argentina. Muestra todos los campos de la tabla en el resultado de la consulta y ordena alfabéticamente
dicho resultado por los nombres de los países.*/
SELECT * FROM clientes_neptuno WHERE pais <> 'Argentina' ORDER BY pais;

/*7. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés que nacieron con menos de 20 semanas
de gestación. Muestra todos los campos de la tabla en el resultado de la consulta y ordena dicho
resultado de mayor a menor, por los valores de la columna SEMANAS.*/
SELECT * FROM nacimientos WHERE semanas < 20 ORDER BY semanas DESC;

/*8. De la tabla NACIMIENTOS, obtén una lista de todos los bebés de sexo femenino, nacidos de madres
extranjeras solteras, de más de 40 años. Muestra todos los campos de la tabla en el resultado de la
consulta.*/
SELECT * FROM nacimientos WHERE sexo = 'Femenino' AND estado_civil_madre = 'Soltera' 
AND nacionalidad = 'Extranjera' AND edad_madre > 40;

/*9. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes que residan en países
sudamericanos. (Los países sudamericanos que figuran en esta tabla son Argentina, Brasil y Venezuela).
Muestra todos los campos de la tabla en el resultado de la consulta y ordena de manera alfabética los
registros, por los nombres de los países y las ciudades.*/
SELECT * FROM clientes_neptuno WHERE pais = 'Argentina' OR pais = 'Brasil' OR 
pais = 'Venezuela' ORDER BY pais, ciudad;

/*10. De la tabla NACIMIENTOS, obtén una lista de todos aquellos bebés que hayan nacido con una cantidad de
semanas de gestación de entre 20 y 25 semanas, inclusive. Muestra todos los campos de la tabla en el
resultado de la consulta y ordena el resultado según las semanas de gestación de los recién nacidos, de menor
a mayor.*/
SELECT * FROM nacimientos WHERE semanas BETWEEN 20 AND 25 ORDER BY semanas;

/*11. De la tabla NACIMIENTOS, utiliza el operador IN y obtén una lista de todos aquellos bebés que nacieron
en las comunas 1101, 3201, 5605, 8108, 9204, 13120 y 15202. Muestra todos los campos de la tabla en el
resultado de la consulta y ordena de menor a mayor los registros, por los números de comuna.*/
SELECT * FROM nacimientos WHERE comuna IN(1101, 3201, 5605, 8108, 9204, 13120, 15202) ORDER BY comuna;

/*12. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes cuyo ID comience con
la letra C. Muestra todos los campos de la tabla, en el resultado de la consulta.*/
SELECT * FROM clientes_neptuno WHERE idcliente LIKE 'C____';
SELECT * FROM clientes_neptuno WHERE idcliente LIKE 'C%';
SELECT * FROM clientes_neptuno;

/*13. De la tabla CLIENTES_NEPTUNO, obtén una lista de todos aquellos clientes que residan en una ciudad que
comience con la letra B y en total posea 5 caracteres. Muestra todos los campos de la tabla en el resultado
de la consulta.*/
SELECT * FROM clientes_neptuno WHERE ciudad LIKE 'B____';

/*14. De la tabla NACIMIENTOS, obtén una lista de todos aquellos padres que tengan más de 10 hijos.*/
SELECT * FROM nacimientos WHERE hijos_total > 10;