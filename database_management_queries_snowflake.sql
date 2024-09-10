-----------------------------------------------------------------------------------------------------
                                    -- DATABASE MANAGEMENT QUERIES
-----------------------------------------------------------------------------------------------------

-- Here's a comprehensive list of unique queries related to databases in Snowflake. These queries cover the creation, modification, management, and inspection of databases.

-- [1] Create a New Database:

CREATE DATABASE GALAXY;


-- [2] Create a Database with a Comment and Replace if exists:

CREATE OR REPLACE DATABASE GALAXY 
COMMENT = 'THIS IS GALAXY DATABASE THAT STORE GALAXY INFORMATION';


-- [3] Create a Database Cloning an Existing Database:

CREATE OR REPLACE DATABASE GALAXY_CLONED CLONE GALAXY;


-- [4] Create a transient database that doesn't have fail-safe data protection

CREATE OR REPLACE TRANSIENT DATABASE GALAXY_TRANSIENT;
