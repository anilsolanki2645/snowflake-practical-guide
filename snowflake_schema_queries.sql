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


-- [14] Revoke All Privileges on a Schema

REVOKE ALL PRIVILEGES ON SCHEMA GALAXY_STAR_SCHEMA FROM ROLE SYSADMIN;


-- [15] Create Schema with Tagging

CREATE OR REPLACE SCHEMA GALAXY_STAR_TAGGED_SCHEMA;
ALTER SCHEMA GALAXY_STAR_TAGGED_SCHEMA SET TAG project_namE = 'STAR_ANALISYS';

-- NOTE : Tag 'PROJECT_NAME' does not exist or not authorized. (IF YOU GET THIS TYPE OF ERROR THEN YOU MUST CREATE TAG FIRST)


-- [16] Create a Schema With WITH MANAGED ACCESS

CREATE OR REPLACE SCHEMA GALAXY_STAR_MANAGED_SCHEMA WITH MANAGED ACCESS;


-- [17] Change Owner of a Schema

GRANT OWNERSHIP ON SCHEMA GALAXY_STAR_MANAGED_SCHEMA TO ROLE SYSADMIN;


-- [18] View Schema Size

SELECT TABLE_SCHEMA, SUM(ACTIVE_BYTES) AS TOTAL_BYTES 
FROM INFORMATION_SCHEMA.TABLE_STORAGE_METRICS
WHERE TABLE_SCHEMA = 'EVENTS'
GROUP BY TABLE_SCHEMA;

SELECT * FROM INFORMATION_SCHEMA.TABLE_STORAGE_METRICS;


-- [19] List All Tables and Views in a Schema

SHOW TABLES IN SCHEMA EVENTS;
SHOW VIEWS IN SCHEMA EVENTS;


-- [20] Create a Schema with Managed Access and comments

CREATE SCHEMA STAR_SCHEMA WITH MANAGED ACCESS
COMMENT = 'THIS IS STAR_SCHEMA THAT STORE STARS INFORMATION';


-- [21] Grant Future Table Privileges in Schema

GRANT SELECT ON FUTURE TABLES IN SCHEMA STAR_SCHEMA TO ROLE SYSADMIN;


-- [22] Set Data Retention Policy on a Schema

ALTER SCHEMA STAR_SCHEMA SET DATA_RETENTION_TIME_IN_DAYS = 10;


-- [23] CASCADE drops the schema and all objects in the schema, including tables with primary/unique keys that are referenced by foreign keys in other tables.

DROP SCHEMA STAR_SCHEMA CASCADE;


-- [24] RESTRICT returns a warning about existing foreign key references and does not drop the schema.

DROP SCHEMA STAR_SCHEMA RESTRICT;


-- [25] List All Objects in a Schema

SHOW OBJECTS IN SCHEMA COLLEGE.EVENTS;


-- [26] Restore a Schema from Time Travel

CREATE SCHEMA COLLEGE.EVENTS_clone CLONE COLLEGE.EVENTS AT (TIMESTAMP => '2024-09-15 00:00:00');


-- [27] List Grants on a Schema

SHOW GRANTS ON SCHEMA STAR_SCHEMA;


-- [28] Remove Tags from a Schema

ALTER SCHEMA GALAXY_STAR_TAGGED_SCHEMA UNSET TAG project_name;


-- [29] Grant Usage on All Schemas in a Database to a Role

GRANT USAGE ON ALL SCHEMAS IN DATABASE GALAXY TO ROLE SYSADMIN;


-- [30] Check if a Schema Exists (Information Schema)

SELECT SCHEMA_NAME 
FROM INFORMATION_SCHEMA.SCHEMATA 
WHERE SCHEMA_NAME = 'STAR_SCHEMA';


-- [31] List All Tables in a Schema Using Information Schema

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'STAR_SCHEMA';


-- [32] List All Privileges on a Schema (Information Schema)

SELECT PRIVILEGE_TYPE, GRANTEE, OBJECT_NAME, OBJECT_SCHEMA 
FROM INFORMATION_SCHEMA.OBJECT_PRIVILEGES 
WHERE OBJECT_SCHEMA = 'EVENTS';


-- [33] Show Historical Queries on a Schema

SELECT *
FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE SCHEMA_NAME = 'EVENTS';


-- [34] Drop a Transient Schema

DROP TRANSIENT SCHEMA IF EXISTS GALAXY_TRANSIENT.GALAXY_SCHEMA_TRANSIENT;
