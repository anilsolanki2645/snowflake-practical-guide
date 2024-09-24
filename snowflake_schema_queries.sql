-----------------------------------------------------------------------------------------------------
                                    -- SNOWFLAKE SCHEMAS QUERIES
-----------------------------------------------------------------------------------------------------

-- Here are unique queries for Schema Types and schemas in Snowflake:

-- [1] Create a Schema:

USE DATABASE GALAXY; -- Use Database Before Create a Schema
CREATE SCHEMA GALAXY_SCHEMA;


-- [2]  Create a Schema with Specific Comment and Data Retention Policy

CREATE OR REPLACE SCHEMA GALAXY_SCHEMA 
COMMENT = 'THIS IS GALAXY SCHEMA THAT STORE GALAXY INFORMATION' DATA_RETENTION_TIME_IN_DAYS = 7;


-- [3] Create a Transient Schema (No Fail-safe Support)

USE DATABASE GALAXY_TRANSIENT;
CREATE OR REPLACE TRANSIENT SCHEMA GALAXY_SCHEMA_TRANSIENT;


-- [4] Create a Schema in a Specific Database

CREATE SCHEMA GALAXY_STARTS.GALAXY_STARTS_SCHEMA;


-- [5] Alter a Schema Name

ALTER SCHEMA GALAXY_STARTS_SCHEMA RENAME TO GALAXY_STAR_SCHEMA;


-- [6] Alter a Schema to Add a Comment

ALTER SCHEMA GALAXY_STAR_SCHEMA 
SET COMMENT = 'THIS IS GALAXY_STAR_SCHEMA THAT STORE GALAXY STARS INFORMATION';


-- [7] Drop a Schema

DROP SCHEMA IF EXISTS GALAXY_STAR_SCHEMA;


-- [8] Clone a Schema

CREATE SCHEMA GALAXY_STAR_SCHEMA_CLONE CLONE GALAXY_STAR_SCHEMA;


-- [9] Show All Schemas in the Current Database

SHOW SCHEMAS;


-- [10] Show Schemas in a Specific Database

SHOW SCHEMAS IN DATABASE GALAXY;


-- [11] Describe a Specific Schema

DESCRIBE SCHEMA GALAXY_STAR_SCHEMA;


-- [12] Grant Usage on a Schema to a Role

GRANT USAGE ON SCHEMA GALAXY_STAR_SCHEMA TO ROLE SYSADMIN;


-- [13] Grant All Privileges on a Schema to a Role

GRANT ALL PRIVILEGES ON SCHEMA GALAXY_STAR_SCHEMA TO ROLE SYSADMIN;

