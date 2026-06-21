# Data Dictionary

# ElderEase

## Web-Based Senior Citizen Assistance and Benefits Management System

---

# Purpose

This document defines every table, column, data type, constraints, and description used in the ElderEase database.

The database is designed for the Office of Senior Citizens Affairs (OSCA) of **San Fernando City, La Union**.

---

# Table: roles

| Column      | Type        | Constraints      | Description            |
| ----------- | ----------- | ---------------- | ---------------------- |
| id          | INT         | PK, AI           | Unique role identifier |
| role_name   | VARCHAR(50) | UNIQUE, NOT NULL | Role name              |
| description | TEXT        | NULL             | Role description       |
| created_at  | TIMESTAMP   | NOT NULL         | Record creation date   |
| updated_at  | TIMESTAMP   | NOT NULL         | Last update            |

---

# Table: users

| Column         | Type                      | Constraints      | Description     |
| -------------- | ------------------------- | ---------------- | --------------- |
| id             | INT                       | PK, AI           | User ID         |
| role_id        | INT                       | FK               | Role reference  |
| first_name     | VARCHAR(100)              | NOT NULL         | First name      |
| last_name      | VARCHAR(100)              | NOT NULL         | Last name       |
| email          | VARCHAR(150)              | UNIQUE           | Email           |
| password       | VARCHAR(255)              | NOT NULL         | Hashed password |
| contact_number | VARCHAR(20)               | NULL             | Mobile number   |
| status         | ENUM('Active','Inactive') | DEFAULT 'Active' | Account status  |
| created_at     | TIMESTAMP                 | NOT NULL         | Creation date   |
| updated_at     | TIMESTAMP                 | NOT NULL         | Update date     |

---

# Table: barangays

| Column        | Type         | Constraints | Description   |
| ------------- | ------------ | ----------- | ------------- |
| id            | INT          | PK, AI      | Barangay ID   |
| barangay_name | VARCHAR(100) | UNIQUE      | Barangay name |
| created_at    | TIMESTAMP    | NOT NULL    | Creation date |
| updated_at    | TIMESTAMP    | NOT NULL    | Update date   |

---

# Table: seniors

| Column                   | Type                                 | Constraints      | Description                     |
| ------------------------ | ------------------------------------ | ---------------- | ------------------------------- |
| id                       | INT                                  | PK, AI           | Senior ID                       |
| user_id                  | INT                                  | FK, NULL         | Future senior portal account    |
| barangay_id              | INT                                  | FK               | Barangay reference              |
| registered_by            | INT                                  | FK               | Staff who registered the senior |
| osca_id                  | VARCHAR(50)                          | UNIQUE           | OSCA ID number                  |
| first_name               | VARCHAR(100)                         | NOT NULL         | First name                      |
| middle_name              | VARCHAR(100)                         | NULL             | Middle name                     |
| last_name                | VARCHAR(100)                         | NOT NULL         | Last name                       |
| suffix                   | VARCHAR(20)                          | NULL             | Jr., Sr., III                   |
| gender                   | ENUM('Male','Female')                | NOT NULL         | Gender                          |
| birth_date               | DATE                                 | NOT NULL         | Date of birth                   |
| civil_status             | VARCHAR(50)                          | NULL             | Civil status                    |
| address                  | TEXT                                 | NOT NULL         | Complete address                |
| contact_number           | VARCHAR(20)                          | NULL             | Contact number                  |
| emergency_contact_name   | VARCHAR(150)                         | NULL             | Emergency contact               |
| emergency_contact_number | VARCHAR(20)                          | NULL             | Emergency contact number        |
| registration_date        | DATE                                 | NOT NULL         | Registration date               |
| status                   | ENUM('Active','Inactive','Deceased') | DEFAULT 'Active' | Senior status                   |
| created_at               | TIMESTAMP                            | NOT NULL         | Creation date                   |
| updated_at               | TIMESTAMP                            | NOT NULL         | Update date                     |

---

# Table: benefit_types

| Column       | Type         | Constraints | Description     |
| ------------ | ------------ | ----------- | --------------- |
| id           | INT          | PK, AI      | Benefit type ID |
| benefit_name | VARCHAR(150) | UNIQUE      | Benefit name    |
| description  | TEXT         | NULL        | Description     |
| created_at   | TIMESTAMP    | NOT NULL    | Creation date   |
| updated_at   | TIMESTAMP    | NOT NULL    | Update date     |

---

# Table: benefits

| Column          | Type          | Constraints | Description            |
| --------------- | ------------- | ----------- | ---------------------- |
| id              | INT           | PK, AI      | Benefit transaction ID |
| senior_id       | INT           | FK          | Senior reference       |
| benefit_type_id | INT           | FK          | Benefit type reference |
| released_by     | INT           | FK          | Staff reference        |
| amount          | DECIMAL(10,2) | NOT NULL    | Benefit amount         |
| release_date    | DATE          | NOT NULL    | Release date           |
| remarks         | TEXT          | NULL        | Additional notes       |
| created_at      | TIMESTAMP     | NOT NULL    | Creation date          |
| updated_at      | TIMESTAMP     | NOT NULL    | Update date            |

---

# Table: appointments

| Column           | Type                                               | Constraints       | Description         |
| ---------------- | -------------------------------------------------- | ----------------- | ------------------- |
| id               | INT                                                | PK, AI            | Appointment ID      |
| senior_id        | INT                                                | FK                | Senior reference    |
| assigned_staff   | INT                                                | FK                | Staff reference     |
| appointment_date | DATE                                               | NOT NULL          | Appointment date    |
| appointment_time | TIME                                               | NOT NULL          | Appointment time    |
| purpose          | VARCHAR(255)                                       | NOT NULL          | Appointment purpose |
| status           | ENUM('Pending','Approved','Completed','Cancelled') | DEFAULT 'Pending' | Appointment status  |
| remarks          | TEXT                                               | NULL              | Additional notes    |
| created_at       | TIMESTAMP                                          | NOT NULL          | Creation date       |
| updated_at       | TIMESTAMP                                          | NOT NULL          | Update date         |

---

# Table: emergency_requests

| Column         | Type                                                | Constraints       | Description          |
| -------------- | --------------------------------------------------- | ----------------- | -------------------- |
| id             | INT                                                 | PK, AI            | Emergency request ID |
| senior_id      | INT                                                 | FK                | Senior reference     |
| assigned_staff | INT                                                 | FK                | Staff reference      |
| request_type   | VARCHAR(100)                                        | NOT NULL          | Assistance category  |
| description    | TEXT                                                | NOT NULL          | Request details      |
| request_date   | DATE                                                | NOT NULL          | Request date         |
| status         | ENUM('Pending','Processing','Completed','Rejected') | DEFAULT 'Pending' | Request status       |
| remarks        | TEXT                                                | NULL              | Additional notes     |
| created_at     | TIMESTAMP                                           | NOT NULL          | Creation date        |
| updated_at     | TIMESTAMP                                           | NOT NULL          | Update date          |

---

# Naming Conventions

## Tables

* snake_case
* plural names

Example:

* users
* benefit_types
* emergency_requests

---

## Columns

* snake_case
* descriptive names

Example:

* first_name
* birth_date
* contact_number

---

## Primary Keys

All tables use:

* id

---

## Foreign Keys

Use the referenced table name followed by `_id`.

Examples:

* role_id
* barangay_id
* senior_id
* benefit_type_id

---

# Database Standard

Every table includes:

* id
* created_at
* updated_at

This ensures consistency and simplifies future maintenance.
