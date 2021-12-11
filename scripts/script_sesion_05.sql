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






