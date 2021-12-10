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

/* CREATE TABLE sales(Order_Line,
				   Order_ID,
				   Order_Date,
				   Ship_Date,
				   Ship_Mode,
				   Customer_ID,
				   Product_ID,
				   Sales,
				   Quantity,
				   Discount,
				   Profit) */

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