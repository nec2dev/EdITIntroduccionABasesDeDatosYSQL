#<-------------Etapa 2.1------------->
/*1. Importar el archivo CSV con el nombre CLIENTES_NEPTUNO (éste se encuentra 
disponible en el área de descargas, del presente módulo) a la base de datos con el 
nombre LABORATORIO. Y tener en cuenta las siguientes indicaciones:
a. No cambiar el nombre de la tabla.
b. Eliminar la tabla en el caso de que ya  exista dentro de la base de datos.
c. Mantener los tipos de datos asignados al momento de la importación.*/
USE laboratorio;
DESC clientes_neptuno;
SELECT * FROM clientes_neptuno;

#<-------------Etapa 2.2------------->
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

#<-------------Etapa 2.3------------->
/*3. Cambiar el nombre de la tabla CLIENTES por 
CONTACTOS.*/
RENAME TABLE clientes TO contactos;
SHOW TABLES;

#<-------------Etapa 2.4------------->
/*4. Importar el archivo CSV con el nombre CLIENTES a la base de 
datos LABORATORIOTEST. Y tener en cuenta las siguientes indicaciones:
a. Este archivo lo encontrarás disponible en el área de descargas del presente módulo.
b. No cambiar el nombre de la tabla.
c. Mantener los tipos de datos asignados al momento de la importación*/
DESC clientes;

#<-------------Etapa 2.5------------->
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

#<-------------Etapa 2.6------------->
/*6. Importar el archivo CSV con el nombre 
PEDIDOS a la base de datos LABORATORIO. 
Y tener en cuenta las siguientes indicaciones:
a. Este archivo lo encontrarás disponible en el área de descargas del presente módulo.
b. No cambiar el nombre de la tabla.
c. Mantener los tipos de datos asignados al momento de la importación.*/
DESC pedidos;

#<-------------Etapa 2.7------------->
/*7. Llevar a cabo los siguientes cambios en la tabla PEDIDOS importada anteriormente. 
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
DESC PEDIDOS;
    
#Pruebas
ALTER TABLE pedidos MODIFY forma_pago ENUM('APLAZADO', 'CONTADO', 'TARJETA') NOT NULL;
ALTER TABLE pedidos MODIFY forma_pago ENUM('APLAZADO', 'CONTADO', 'TARJETA');
DESC pedidos;
INSERT INTO pedidos VALUES (99999, 'ABC123Z', '2022-08-08', 'BARRANI', 'SI');
INSERT INTO pedidos VALUES (88888, 'ABC123Z', '2022-08-08', 'TARJETA', 'NO');
INSERT INTO pedidos VALUES (77777, 'ABC123Z', '2022-08-08', NULL, 'SI');
INSERT INTO pedidos VALUES (66666, 'ABC123Z', '2022-08-08', 'SI');
SELECT * FROM pedidos;
 
 #<-------------Etapa 2.8------------->
/*8. Importar el archivo CSV: PRODUCTOS a la base de datos LABORATORIO. Y tener en 
cuenta las siguientes indicaciones:
a. Este archivo lo encontrarás disponible en  el área de descargas del presente módulo.
b. No cambiar el nombre de la tabla.
c. Mantener los tipos de datos asignados al momento de la importación.*/
DESC productos;

#<-------------Etapa 2.9------------->
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


