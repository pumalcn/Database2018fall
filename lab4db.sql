CREATE DATABASE lab5;

CREATE TABLE customers(
  customer_id INTEGER PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INTEGER,
  salesman_id INTEGER REFERENCES salesman(salesman_id)
);

  CREATE TABLE orders(
    ord_no INTEGER PRIMARY KEY,
    purch_amt DOUBLE PRECISION,
    ord_date DATE,
    customer_id INTEGER REFERENCES customers(customer_id),
    salesman_id INTEGER REFERENCES salesman(salesman_id)
  );

  CREATE TABLE salesman(
    salesman_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255) REFERENCES customers(city),
    commission DOUBLE PRECISION
  );

SELECT sum(purch_amt)
FROM orders;

SELECT avg(purch_amt)
FROM orders;

SELECT count(cust_name)
from customers
WHERE cust_name NOTNULL;


SELECT min(purch_amt)
FROM orders;


SELECT *
FROM customers
WHERE cust_name
        LIKE '%b';


SELECT *
FROM orders
WHERE customer_id IN (SELECT customer_id
                      FROM customers
                      WHERE city='New York');


SELECT *
FROM customers
WHERE customer_id IN (SELECT customer_id
                      FROM orders
                      WHERE purch_amt > 10);


SELECT sum(grade) AS "sum_grade"
FROM customers;


SELECT *
FROM customers
WHERE cust_name NOTNULL;


SELECT max(grade)
FROM customers