-----------------------------------------------------------------------------------------------------
                                    -- TABLES RELATED QUERIES
-----------------------------------------------------------------------------------------------------

-- create database and schema to create a table in that

CREATE OR REPLACE DATABASE EMP;

CREATE OR REPLACE SCHEMA EMP_SCHEMA;


-- [1] Create a Permanent Table

CREATE TABLE EMPLOYEE (
    id INT,
    name STRING,
    created_at TIMESTAMP
); 


-- [2] Create a Temporary Table

CREATE TEMPORARY TABLE TEMP_EMPLOYEE (
    session_id INT,
    user_name STRING
); 


-- [3] Create a Transient Table

CREATE TRANSIENT TABLE TRANSIENT_EMPLOYEE (
    sale_id INT,
    product_id INT,
    amount DECIMAL(10, 2)
);


-- [4] Create an External Table

CREATE EXTERNAL TABLE EXTERNAL_EMPLOYEE (
    id INT,
    data STRING,
    created_at TIMESTAMP
)
WITH LOCATION = @my_external_stage
FILE_FORMAT = (TYPE = 'CSV');


-- [5] Create a Table with a Clustering Key

CREATE TABLE ORDERS (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
)
CLUSTER BY (customer_id, order_date);


-- [6] Create a Table with a Default Value

CREATE TABLE PRODUCT (
    product_id INT,
    product_name STRING,
    price DECIMAL(10, 2) DEFAULT 0.00
);


-- [7] Create a Table with a Sequence as a Default Value

CREATE SEQUENCE PRODUCT_SEQ;
CREATE TABLE PRODUCT_SEQ_TAB (
    product_id INT DEFAULT PRODUCT_SEQ.NEXTVAL,
    product_name STRING
);


-- [8] Create a Table with a Unique Constraint

CREATE TABLE UNIQUE_EMPLOYEE (
    employee_id INT,
    email STRING UNIQUE
);


-- [9] Create a Table with a Foreign Key

CREATE TABLE DEPARTMENT (
    department_id INT PRIMARY KEY,
    department_name STRING
);
CREATE TABLE F_EMPLOYEE (
    employee_id INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
);


-- [10] Create a Table with a Primary Key

CREATE TABLE CUSTOMERS (
    customer_id INT PRIMARY KEY,
    customer_name STRING
);


-- [11] Create a Table with NOT NULL Constraints

CREATE TABLE SALES (
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    sale_date DATE NOT NULL
);


-- [12] Create a Table with Default Column Collation

CREATE TABLE DEFAULT_EMPLOYEE (
    col1 STRING COLLATE 'en-ci',
    col2 STRING COLLATE 'fr'
);


-- [13] Create a Table from an Existing Table (No Data)

CREATE TABLE STATGING_SALES LIKE SALES;


-- [14] Create a Table from an Existing Table (With Data)

CREATE TABLE NEW_CUSTOMERS AS
SELECT * FROM CUSTOMERS;


-- [15] Insert Data into a Table

INSERT INTO EMPLOYEE (id, name, created_at)
VALUES (1, 'John Doe', CURRENT_TIMESTAMP);


-- [16] Insert Multiple Rows into a Table

INSERT INTO EMPLOYEE (id, name, created_at)
VALUES 
    (2, 'Jane Smith', CURRENT_TIMESTAMP),
    (3, 'Bob Johnson', CURRENT_TIMESTAMP);
    

-- [17] Update Data in a Table

UPDATE EMPLOYEE
SET name = 'John Smith'
WHERE id = 1;