# Dog Spa Access Model

## Overview
This project is a PostgreSQL schema-based access control model designed for a dog spa application. The system ensures that customers can securely manage their dog's records, such as grooming history, without accessing other customers' data.


## Features
1. **Schemas for Customer Data Isolation**: Each customer has their personal schema to securely store their dog records.
2. **Role-Based Access Control**: Roles are created for each customer, ensuring they can only interact with their own data.
3. **Future-Proof Permissions**: Default privileges are set up to ensure new tables in each schema inherit the proper permissions.
4. **Security Enhancements**:
   - Passwords are excluded for security.
   - Public schema usage is restricted.

## Database Schema
The system contains two sample schemas (`customer1` and `customer2`) with the following table structure:

## Script Features
The SQL script includes:
1. **Schema Creation**: Separate schemas for each customer.
2. **Table Creation**: A `dogs` table in each schema.
3. **Role Creation**: Database roles with login access.
4. **Permission Grants**: Usage and read-only (`SELECT`) permissions.
5. **Default Privileges**: Ensuring permissions apply to future tables.
6. **Search Path Isolation**: Restricting each role to its respective schema.
7. **Public Schema Restriction**: Preventing unintended usage of the default `public` schema.

## Usage Instructions
### Prerequisites
- PostgreSQL installed on your system.
- Basic knowledge of PostgreSQL commands.
