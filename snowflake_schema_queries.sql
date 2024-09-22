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
