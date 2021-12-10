Create Table tabla_clientes(
	Id_cliente int, 
	Nombre varchar,
	Apellido varchar,
	Edad int,
	correo varchar
);

SELECT * FROM tabla_clientes;

INSERT INTO tabla_clientes
VALUES (1, 'Cintia', 'Cee', 20, 'ab@xyz.com');

INSERT INTO tabla_clientes(Id_cliente, Nombre, Edad, correo)
VALUES (4, 'Raul', 23, 'ef@xyz.com');

INSERT INTO tabla_clientes
VALUES (3, 'Euclides', 'Ef', 27, 'ef@xyz.com'),(4, 'Gabriela', 'Eh', 35, 'gh@xyz.com');

COPY tabla_clientes(Id_cliente, Nombre, Apellido, Edad, correo)
	FROM 'C:\Users\Public\Documents\aabd_sql_2021\copy.csv'  /*Recuerda que el archivo debe estar en una carpeta pública*/
DELIMITER ',' CSV HEADER;

COPY tabla_clientes(Id_cliente, Nombre, Apellido, Edad, correo)
FROM 'C:\Users\Public\Documents\aabd_sql_2021\copytext.txt' /*Recuerda que el archivo debe estar en una carpeta pública*/
DELIMITER ',' ;

SELECT * FROM tabla_clientes

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

SELECT nombre FROM tabla_clientes; /*tabla_clientes$nombre */

SELECT nombre,apellido FROM tabla_clientes; /* tabla_clientes[,c("nombre","apellido")]*/

SELECT * FROM tabla_clientes; 

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

SELECT DISTINCT nombre FROM tabla_clientes;
SELECT * FROM tabla_clientes;

SELECT DISTINCT Nombre, Edad FROM tabla_clientes;

COPY tabla_clientes(Id_cliente, Nombre, Apellido, Edad, correo)
	FROM 'C:\Users\Public\Documents\aabd_sql_2021\copy.csv'  /*Recuerda que el archivo debe estar en una carpeta pública*/
DELIMITER ',' CSV HEADER;

SELECT * FROM tabla_clientes;

SELECT DISTINCT * FROM tabla_clientes;

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

SELECT * FROM tabla_clientes; /*SELECT COUNT(*) FROM tabla_clientes; para saber cuántos
renglones tiene la tabla */

SELECT nombre FROM tabla_clientes WHERE edad = 25;

SELECT nombre, edad FROM tabla_clientes WHERE edad > 25;

SELECT * FROM tabla_clientes WHERE nombre = 'Gabriela' /* los datos de tipo texto, como en este 
caso Gabriela, siempre van entre comillas simples */

SELECT nombre, apellido, edad FROM tabla_clientes WHERE edad > 20 AND edad < 30;

SELECT nombre, apellido, edad FROM tabla_clientes WHERE (edad <= 25 OR edad > 30) AND nombre = 'Gabriela';

SELECT nombre, apellido, edad FROM tabla_clientes WHERE edad <= 25 OR (edad > 30 AND nombre = 'Gabriela');

SELECT nombre, apellido, edad FROM tabla_clientes WHERE NOT edad = 25; /*edad != 25 */

SELECT nombre, apellido, edad FROM tabla_clientes WHERE NOT edad = 25 AND NOT nombre = 'Jacobo';

/* Las Leyes de De Morgan dicen que NO(P O Q) = NO(P) Y NO(Q);  NO(P Y Q) = NO(P) O NO(Q)   */

SELECT nombre, apellido, edad FROM tabla_clientes WHERE NOT (edad = 25 OR nombre = 'Jacobo');

SELECT nombre, edad FROM tabla_clientes WHERE edad <> 25;

SELECT nombre, edad FROM tabla_clientes WHERE NOT edad != 25;

/*  Y se escribe ^; O se escribe v; Negación se escribe ! */

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

SELECT * FROM tabla_clientes;

UPDATE tabla_clientes SET Apellido = 'Pe', Edad = 17 WHERE Id_cliente = 2;

UPDATE tabla_clientes SET correo = 'gee@xyz.com' WHERE Nombre = 'Gabriela' OR Nombre = 'gabriela';

UPDATE tabla_clientes SET correo = 'gee@xyz.com';

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

DELETE FROM tabla_clientes WHERE Id_cliente = 6; 

DELETE FROM tabla_clientes WHERE edad > 25; 

SELECT * FROM tabla_clientes;

DELETE FROM tabla_clientes;

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

SELECT * FROM tabla_clientes;

/* Seleccionar vacíos */

SELECT * FROM tabla_clientes WHERE apellido IS NULL AND nombre = 'Raul'; 

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

ALTER TABLE tabla_clientes ADD prueba varchar;
SELECT * FROM tabla_clientes;

ALTER TABLE tabla_clientes DROP COLUMN prueba;

ALTER TABLE tabla_clientes ALTER COLUMN Edad TYPE varchar;

ALTER TABLE tabla_clientes RENAME COLUMN correo TO correo_cliente;

/*#####################################################*/
/*#####################################################*/
/*#####################################################*/

SELECT * FROM tabla_clientes;

ALTER TABLE tabla_clientes ALTER COLUMN Id_cliente SET NOT NULL;
INSERT INTO tabla_clientes(Nombre, Apellido, Edad, correo_cliente) VALUES ('aa','bb',25,'ab@xyz.com') ;

ALTER TABLE tabla_clientes ALTER COLUMN Id_cliente DROP NOT NULL;

ALTER TABLE tabla_clientes ADD CONSTRAINT Id_cliente CHECK (Id_cliente>0);
INSERT INTO tabla_clientes VALUES (-1,'cc','dd',67,'ab@xyz.com');

INSERT INTO tabla_clientes VALUES (2021,'cc','dd',67,'ab@xyz.com');

ALTER TABLE tabla_clientes ADD PRIMARY KEY (Id_cliente);

