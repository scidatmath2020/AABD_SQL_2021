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
VALUES (2, 'Diana', 22, 'd@xyz.com');

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