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


-- [5] Create a database with a specified data retention period

CREATE OR REPLACE DATABASE GALAXY_WITH_RETENTION_TIME 
DATA_RETENTION_TIME_IN_DAYS = 5;


-- [6] List all databases available in the account

SHOW DATABASES;


-- [7] Show databases that match a specific pattern

SHOW DATABASES LIKE 'GAL_%';


-- [8] Describe the properties of a specific database

DESCRIBE DATABASE GALAXY;


-- [9] Switch to a specific database to start working within it

USE DATABASE GALAXY_CLONED;


-- [10] Rename an existing database

ALTER DATABASE IF EXISTS GALAXY_CLONED RENAME TO GALAXY_STARTS;


-- [11] Modify the data retention time of an existing database

ALTER DATABASE GALAXY_WITH_RETENTION_TIME 
SET DATA_RETENTION_TIME_IN_DAYS = 10;


-- [12] Add or modify a comment on a database

ALTER DATABASE GALAXY SET 
COMMENT = 'THIS IS GALAXY DATABASE THAT STORE GALAXY AND STAR INFORMATION';


-- [13] Drop a specific database; this action deletes all schemas and tables within it

DROP DATABASE GALAXY;


-- [14] Drop a database only if it exists

DROP DATABASE IF EXISTS GALAXY;


-- [15] Restore a dropped database within the retention period

UNDROP DATABASE GALAXY;


-- [16] Grant all privileges on a database to a specific role

GRANT ALL PRIVILEGES ON DATABASE GALAXY TO ROLE SYSADMIN;


-- [17] Revoke specific privileges from a role on a database

REVOKE USAGE ON DATABASE GALAXY FROM ROLE SYSADMIN;


-- [18] Revoke ALL privileges from a role on a database

REVOKE ALL ON DATABASE GALAXY FROM ROLE SYSADMIN;


-- [19] Transfer ownership of a database to another role

GRANT OWNERSHIP ON DATABASE GALAXY TO ROLE SYSADMIN;


-- [20] Set a specific parameter for a database

ALTER DATABASE GALAXY SET PARAMETER STATEMENT_TIMEOUT_IN_SECONDS = 300;


-- [21] Refresh a cloned database to synchronize it with its source

ALTER DATABASE GALAXY_STARTS REFRESH;


-- [22] Create a new database clone with a specific name
CREATE OR REPLACE DATABASE GALAXY_MILKY CLONE GALAXY AT (TIMESTAMP => '2024-09-01 12:00:00');


-- [23] Display roles that have privileges on a specific database
SHOW GRANTS ON DATABASE GALAXY;

