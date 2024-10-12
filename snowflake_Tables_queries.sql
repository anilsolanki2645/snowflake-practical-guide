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


-- [18] Delete Data from a Table

DELETE FROM EMPLOYEE WHERE id = 1;

-- [19] Truncate a Table

TRUNCATE TABLE EMPLOYEE;


-- [20] Drop a Table

DROP TABLE IF EXISTS EMPLOYEE;

-- [21] Clone a Table (Time Travel)

CREATE TABLE EMPLOYEE_CLONE CLONE EMPLOYEE AT (TIMESTAMP => '2024-10-01 10:28:07.144');


-- [22] Create a Table with a Time Travel Retention Policy

CREATE TABLE TIME_TRAVEL_EMPLOYEE (
    id INT,
    name STRING
)
DATA_RETENTION_TIME_IN_DAYS = 7;


-- [23] Retrieve Historical Data (Time Travel)

SELECT * FROM EMPLOYEE AT (TIMESTAMP => '2024-10-01 10:28:07');


-- [24] Create a Table with Stream Support

CREATE TABLE STREAM_EMPLOYEE (
    id INT,
    status STRING
);
CREATE STREAM STREAM_EMPLOYEE_STREAMING ON TABLE STREAM_EMPLOYEE;


-- [25] Alter a Table to Add a Column

ALTER TABLE EMPLOYEE ADD COLUMN status STRING DEFAULT 'active';


-- [26] Alter a Table to Drop a Column

ALTER TABLE EMPLOYEE DROP COLUMN status;

-- [27] Alter a Table to Modify Column Data Type

ALTER TABLE EMPLOYEE MODIFY COLUMN name STRING(100);


-- [28] Create a Materialized View from a Table

CREATE MATERIALIZED VIEW mv_orders AS
SELECT order_id, customer_id, amount FROM orders;


-- [30] Create a Secure View on a Table

CREATE SECURE VIEW secure_view AS
SELECT * FROM EMPLOYEE;

-- [31] Show Tables in the Current Schema

SHOW TABLES;

-- [32] Describe a Table

DESCRIBE TABLE EMPLOYEE;

-- [33] Show Table Details

SHOW TABLES LIKE 'EMPLOYEE';

-- [34] List All Tables in a Specific Database

SHOW TABLES IN DATABASE EMP;

-- [35] Check the Size of a Table

SELECT * 
FROM INFORMATION_SCHEMA.TABLE_STORAGE_METRICS 
WHERE TABLE_NAME = 'EMPLOYEE';

-- [36] Check Row Count in a Table

SELECT ROW_COUNT 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'EMPLOYEE';

-- [37] Create Table with Column-Level Security (Tags)

CREATE TABLE secure_sales (
    sale_id INT,
    sale_amount DECIMAL(10, 2) TAG security_classificatio = 'high'
);