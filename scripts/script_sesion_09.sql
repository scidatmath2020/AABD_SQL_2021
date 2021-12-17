CREATE TABLE customer(customer_id varchar,  /* customer$customer_id */
					  Customer_Name varchar,
					  Segment varchar,
					  Age int,
					  Country varchar,
					  City varchar,
					  State varchar,
					  Postal_Code int,
					  Region varchar);
					  
COPY customer FROM 'C:\Users\Public\Documents\aabd_sql_2021\Customer.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM customer;

SELECT * FROM customer WHERE city = 'Philadelphia' OR city = 'Seattle' OR city = 'Los Angeles';

SELECT * FROM customer WHERE city IN ('Philadelphia', 'Seattle');

SELECT DISTINCT city FROM customer WHERE city IN ('Philadelphia', 'Seattle');

SELECT * FROM customer WHERE city IN ('Philadelphia', 'Seattle') AND Segment = 'Corporate';

/*##################################################*/
/*##################################################*/
/*##################################################*/

SELECT * FROM customer WHERE age >= 20 AND age <= 30;

SELECT * FROM customer WHERE age BETWEEN 20 AND 30; /*el between toma en cuenta los extremos*/

SELECT * FROM customer WHERE (age NOT BETWEEN 20 AND 30) AND city IN ('Philadelphia','Los Angeles');

/*##################################################*/
/*##################################################*/
/*##################################################*/

SELECT * FROM customer WHERE customer_name LIKE 'J%' ;

SELECT * FROM customer WHERE customer_name LIKE '%Nelson%' ;

SELECT * FROM customer WHERE customer_name LIKE '____ %' ;

SELECT DISTINCT city FROM customer WHERE city NOT LIKE 'S%';

SELECT DISTINCT city FROM customer WHERE city NOT LIKE '%Seattle%';

SELECT * FROM customer WHERE customer_name LIKE 'Ger\%%' ;

/*Hay un cliente que se llama Ger%do */

SELECT * FROM customer WHERE customer_name LIKE 'sol' ;

/*##################################################*/
/*##################################################*/
/*##################################################*/

CREATE TABLE sales(Order_Line int Primary Key,
				   Order_ID varchar,
				   Order_Date date,
				   Ship_Date date,
				   Ship_Mode varchar,
				   Customer_ID varchar,
				   Product_ID varchar,
				   Sales numeric,
				   Quantity int,
				   Discount numeric,
				   Profit numeric);

CREATE TABLE product(product_id varchar PRIMARY KEY,
					 category varchar,
					 sub_category varchar,
					 product_name varchar);

COPY sales FROM 'C:\Users\Public\Documents\aabd_sql_2021\sales.csv' DELIMITER ',' CSV HEADER;
COPY product FROM 'C:\Users\Public\Documents\aabd_sql_2021\product.csv' DELIMITER ',' CSV HEADER;

/*##################################################*/
/*##################################################*/
/*##################################################*/

SELECT * FROM sales;

SELECT * FROM product;

SELECT * 
FROM customer 
WHERE state = 'California' 
ORDER BY customer_name; 

SELECT * 
FROM customer 
WHERE state = 'California' 
ORDER BY customer_name DESC; 

SELECT * 
FROM customer 
WHERE age > 25 
ORDER BY city ASC, customer_name DESC, state; 

SELECT * 
FROM customer
ORDER BY age

/*##################################################*/
/*##################################################*/
/*##################################################*/

SELECT * 
FROM customer
WHERE age >= 25
ORDER BY age DESC
LIMIT 8;

SELECT * 
FROM customer
WHERE age >= 25
ORDER BY age 
LIMIT 10;

/*##################################################*/
/*##################################################*/
/*##################################################*/

SELECT customer_id AS "Num de cliente", customer_name AS nombre, age AS "Edad"
FROM customer;

select * from customer

/*##################################################*/
/*##################################################*/
/*##################################################*/

select count(*) from customer;
select count(*) from sales;
select count(*) from product;

select * from sales limit 5;

SELECT COUNT(order_line) AS "Número de productos que se ordenaron",
COUNT(DISTINCT order_id) AS "Número de órdenes distintas"
FROM sales WHERE customer_id = 'CG-12520';

SELECT SUM(profit) AS "Total de ganacia"
FROM sales;


select * from product limit 5;

SELECT product_id FROM product WHERE product_name = 'Bretford CR4500 Series Slim Rectangular Table';

/* FUR-TA-10000577 */

select * from sales limit 5;

SELECT SUM(quantity) AS "Productos vendidos" FROM sales WHERE product_id = 'FUR-TA-10000577';

SELECT AVG(age) AS "Promedio de edad" FROM customer

SELECT AVG(0.10*sales) AS "Comisión promedio por venta" FROM sales;

select * from sales;

SELECT MIN(sales) AS "Mínimo entrada en junio" FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

SELECT MAX(sales) AS "Mínimo entrada en junio" FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

SELECT MAX(sales) FROM sales WHERE order_date BETWEEN '2015-01-01' AND '2015-12-31';

/* 6354.95 */

SELECT order_date 
FROM sales 
WHERE (order_date BETWEEN '2015-01-01' AND '2015-12-31') AND sales = 6354.95;


SELECT MIN(order_date) FROM sales; /* 2014-01-03 */
SELECT MAX(order_date) FROM sales; /* 2017-12-30 */

SELECT MAX(sales) FROM sales WHERE order_date BETWEEN '2014-01-03' AND '2017-12-30';
/* 22638.48 */

SELECT order_date 
FROM sales 
WHERE sales = 22638.48;

/*##################################################*/
/*##################################################*/
/*##################################################*/

SELECT * FROM customer;
SELECT DISTINCT region FROM customer;

SELECT COUNT(customer_id) FROM customer WHERE region = 'South'
SELECT COUNT(customer_id) FROM customer WHERE region = 'West'
SELECT COUNT(customer_id) FROM customer WHERE region = 'East'
SELECT COUNT(customer_id) FROM customer WHERE region = 'Central'

SELECT region AS "Región", 
COUNT(customer_id) AS "Total de clientes"
FROM customer 
GROUP BY region;

/*
tapply(customer$FAC,customer$region,sum)
*/

select * from sales;

SELECT product_id AS "Producto", 
SUM(quantity) AS Total_vendidos
FROM sales 
GROUP BY product_id
ORDER BY Total_vendidos DESC;

SELECT 
region AS "Región", state AS "Estado",
COUNT(customer_id) AS "Total de clientes", 
AVG(age) AS "Edad promedio"
FROM customer 
GROUP BY region, state;

select count(customer_id) from customer

SELECT 
customer_Id AS Cliente,
MIN(sales) AS min_ventas,
MAX(sales) AS max_ventas,
AVG(sales) AS prom_ventas,
SUM(sales) AS total_ventas
FROM sales
GROUP BY customer_Id
ORDER BY prom_ventas DESC
LIMIT 5;

/*##################################################*/
/*##################################################*/
/*##################################################*/

select * from customer;

SELECT region, 
COUNT(customer_id) AS "Total de clientes"
FROM customer
GROUP BY region
HAVING COUNT(customer_id)>200;

SELECT region, COUNT(customer_id) AS "Total de clientes"
FROM customer
WHERE customer_name LIKE 'A%'
GROUP BY region
HAVING COUNT(customer_id) BETWEEN 15 AND 20;


SELECT * FROM customer WHERE customer_name LIKE 'A%'

/*##################################################*/
/*##################################################*/
/*##################################################*/

-- Existe Do?  

SELECT *,
CASE
	WHEN age < 30 THEN 'Joven'
	WHEN age > 60 THEN 'Mayor'
	ELSE 'Medio'
END AS "Categoría de edad"
FROM customer;

CREATE TABLE tabla_grupo_edad
as
SELECT *,
CASE
	WHEN age < 30 THEN 'Joven'
	WHEN age > 60 THEN 'Mayor'
	ELSE 'Medio'
END AS "Categoría de edad"
FROM customer;

select * FROM tabla_grupo_edad
select * from regiones_clientes_letraa_10_20

/*##################################################*/
/*##################################################*/
/*##################################################*/

CREATE TABLE sales_2015 AS SELECT * FROM sales WHERE ship_date BETWEEN '2015-01-01' AND '2015-12-31';
CREATE TABLE customer_20_60 AS SELECT * FROM customer WHERE age BETWEEN 20 and 60;

select * from sales;
select * from customer;

/*##################################################*/
/*##################################################*/
/*##################################################*/

SELECT * FROM sales;
SELECT * FROM customer;

create table customer_60 as
select customer_id, names_id from customer where age > 60;

SELECT DISTINCT customer_id
FROM customer
WHERE age>60;


SELECT *
FROM sales
WHERE customer_id IN
	(SELECT DISTINCT customer_id
	FROM customer
	WHERE age>60);


select * from sales;

SELECT product_id, SUM(quantity) AS cantidad FROM sales
GROUP BY product_id

select * from product


SELECT
	a.product_id,
	a.product_name,
	a.category,
	b.cantidad
FROM product AS a
	LEFT JOIN
		(SELECT product_id, SUM(quantity) AS cantidad FROM sales
		GROUP BY product_id) AS b
	ON a.product_id = b.product_id
ORDER BY b.cantidad DESC;

SELECT
	customer_id,
	order_id,
	(SELECT customer_name FROM customer
	WHERE sales.customer_id = customer.customer_id)
FROM sales 
ORDER BY customer_id DESC;

/*##################################################*/
/*##################################################*/
/*##################################################*/

	
CREATE table logistica AS
SELECT
a.order_line,
b.customer_id,
b.customer_name,
b.city,
b.state,
b.country
FROM sales AS a
LEFT JOIN customer AS b
ON a.customer_id = b.customer_id
ORDER BY a.order_line;

/*##################################################*/
/*##################################################*/
/*##################################################*/


select * from logistica;

update nombre 
set nombre col value

DROP VIEW logistica;

/*##################################################*/
/*##################################################*/
/*##################################################*/

-- char(n), varchar, text
-- LENGTH

SELECT LENGTH('hola   ');

SELECT customer_name, LENGTH(customer_name) AS caracteres
FROM customer
WHERE age > 30;

SELECT customer_name as "nombres largos"
FROM customer
WHERE LENGTH(customer_name) > 10;

-- UPPER y LOWER

SELECT LOWER('Yo soy Popeye');

SELECT customer_name AS nombre,
UPPER(customer_name) AS May, LOWER(customer_name) AS Min
FROM customer
WHERE age > 30;

-- REPLACE

SELECT REPLACE('Yo soy Popeye','soy','quiero ser');
SELECT REPLACE(lower('Yo Soy Popeye'),'soy','quiero ser');

SELECT customer_name, country,
REPLACE(country,'United States','US') AS "country_new"
FROM customer;

-- TRIM, LTRIM, RTRIM

SELECT TRIM(LEADING ' ' FROM '      Yo soy Popeye BB');--  Yo soy Popeye BB
SELECT TRIM(TRAILING 'B' FROM '      Yo soy Popeye BB');--  Yo soy Popeye
SELECT TRIM(BOTH ' ' FROM '      Yo soy Popeye BB              ');--  Yo soy Popeye

SELECT LTRIM('       Yo soy Popeye ',' ')
SELECT RTRIM(' Yo soy Popeye     ',' ')

-- Concatenación

SELECT customer_name, city, state, country, city || ' en '  || state || ', ' || country AS direccion
FROM customer;

SELECT * FROM PRODUCT;

SELECT product_id || ' es un ' || product_name AS "descripcion humana" FROM product;

SELECT 'HOLA' || ' ' || 'MUNDO';

-- subcadenas

SELECT SUBSTRING('Este es un texto' FROM 3 FOR 5); -- FROM es el inicio y FOR es la cantidad

SELECT customer_id,customer_name, SUBSTRING(customer_id FOR 2) AS cust_grupo
FROM customer
WHERE SUBSTRING(customer_id FOR 2) = 'AB';


SELECT customer_id, customer_name, SUBSTRING(customer_id FROM 4 FOR 5) AS cust_numero
FROM customer
WHERE SUBSTRING(customer_id FOR 2) = 'AB';

/*  id = ABC-01-DEFG */

-- concatenado con delimitador

SELECT STRING_AGG(product_id,', ') from sales; /*", ".join(lista)*/

SELECT order_id, STRING_AGG(product_id,', ')
FROM sales
GROUP BY order_id;

select * from sales;


SELECT state, STRING_AGG(customer_id,', ')
FROM customer
GROUP BY state;

/* 
una tabla de dos columas donde la primer columna sea el estado y la segunda sean las ciudades
*/

SELECT state, STRING_AGG(distinct city,', ')
FROM customer
GROUP BY state;

select * from customer;

/*##################################################*/
/*##################################################*/
/*##################################################*/

-- Piso y techo

SELECT FLOOR(782634.49887234);  -- techo = piso + 1 a menos que el número sea entero; cuando el número es 
								-- entero, entonces techo = piso
SELECT CEIL(782634.49887234);

SELECT order_line, sales, FLOOR(sales), CEIL(sales)
FROM sales
WHERE discount > 0;

select floor(3)
select ceil(3)

select * from sales

-- aleatoriedad

select random()  -- cristóbal 0.8705, claudia 0.6327, julio 0.1536, jesús 0.49344

select RANDOM()*(50 - 10) + 10; -- simulando una variable aleatoria uniforme continua en [10,50)
select RANDOM()*(12.3 - 11.2) + 11.2;

select FLOOR(RANDOM()*(50 - 10 + 1)) + 10; -- generar enteros entre 10 y 50, incluyendo a ambos

select FLOOR(RANDOM()*8) + 1;

-- semilla de aleatoriedad

SELECT SETSEED(0.4);
select random(), random(), random(), random(), random(), random(), random(), random(), random(), random();

SELECT SETSEED(0.4);
select random()

SELECT SETSEED(0.5);
SELECT RANDOM(), RANDOM()*(50-10)+10, FLOOR(RANDOM()*(50-10+1))+10;

select random()

-- round

SELECT order_line, sales, ROUND(sales),ROUND(sales,2)
FROM sales;

-- potencias

SELECT POWER(6,2), POWER(4,0.5);

SELECT distinct age, POWER(age,2) FROM customer ORDER BY age;

-- fecha y hora actuales

SELECT CURRENT_DATE, CURRENT_TIME, CURRENT_TIME(3), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP(3);


