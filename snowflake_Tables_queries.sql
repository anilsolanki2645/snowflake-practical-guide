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
