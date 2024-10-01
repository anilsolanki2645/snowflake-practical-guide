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
