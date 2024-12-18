-- Creating Schemas
CREATE SCHEMA customer1;
CREATE SCHEMA customer2;

-- Table Creation for customer-specific dog records

CREATE TABLE customer1.dogs(
dog_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,-- Auto-incremented ID for dogs
name GENERATED ALWAYS AS IDENTITY,
breed VARCHAR(50),
owner_name text,
last_grooming DATE 
);

CREATE TABLE customer2.dogs(
dog_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Auto-incremented ID for dogs
name text,
breed VARCHAR(50),
owner_name text,
last_grooming DATE 
);

-- Role Creation (Replace placeholders with actual passwords in execution)

CREATE ROLE customer1 WITH LOGIN PASSWORD '<replace_with_secure_password>';
CREATE ROLE customer2 WITH LOGIN PASSWORD '<replace_with_secure_password>';
--Granting USAGE and read-only(SELECT) permissions to roles

GRANT USAGE ON SCHEMA customer1 TO customer1;
GRANT USAGE ON SCHEMA customer2 TO customer2;

GRANT SELECT ON ALL TABLES IN SCHEMA customer1 TO customer1;
GRANT SELECT ON ALL TABLES IN SCHEMA customer2 TO customer2;

-- Future-Proof Permissions for new tables

ALTER DEFAULT PRIVILEGES IN SCHEMA customer1 GRANT SELECT ON TABLES TO customer1;
ALTER DEFAULT PRIVILEGES IN SCHEMA customer2 GRANT SELECT ON TABLES TO customer2;

--Ensuring each ROLE can only interact with their schema by default

ALTER ROLE customer1 SET SEARCH_PATH TO customer1;
ALTER ROLE customer2 SET SEARCH_PATH TO customer2;

/* The above setting is redundant because by default
Search_path = $USER, PUBLIC in postgresql.conf */

-- Restrict Public Schema Usage
REVOKE CREATE ON SCHEMA public FROM PUBLIC;


