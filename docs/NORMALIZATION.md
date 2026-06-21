# Database Normalization

# ElderEase

## Web-Based Senior Citizen Assistance and Benefits Management System

---

# Purpose

This document demonstrates the normalization process used to design the ElderEase database.

Normalization is performed to eliminate redundant data, reduce update anomalies, improve data integrity, and ensure an efficient database structure.

The final database design follows **Third Normal Form (3NF)**.

---

# What is Normalization?

Normalization is the process of organizing data into separate tables to reduce duplication and maintain consistency.

Benefits include:

* Reduced data redundancy
* Improved data integrity
* Easier maintenance
* Better scalability
* Faster updates

---

# Unnormalized Form (UNF)

Suppose all information is stored in one table.

| Senior ID | Senior Name    | Barangay       | Benefit Type       | Benefit Amount | Appointment Date | Staff Name |
| --------- | -------------- | -------------- | ------------------ | -------------- | ---------------- | ---------- |
| 1001      | Juan Dela Cruz | Santiago Norte | Social Pension     | 500            | July 15          | Maria      |
| 1001      | Juan Dela Cruz | Santiago Norte | Medical Assistance | 2000           | August 2         | Maria      |
| 1002      | Pedro Santos   | Pagdaraoan     | Social Pension     | 500            | July 18          | Carlo      |

Problems:

* Senior information is repeated.
* Barangay is repeated.
* Staff name is repeated.
* Benefit information is duplicated.
* Updating one value requires updating multiple rows.
* High risk of inconsistent data.

---

# First Normal Form (1NF)

Requirements:

* Each column contains only one value.
* No repeating groups.
* Every record has a unique primary key.

Tables begin to separate repeating information.

Example:

## Seniors

| senior_id | first_name | last_name | barangay       |
| --------- | ---------- | --------- | -------------- |
| 1001      | Juan       | Dela Cruz | Santiago Norte |
| 1002      | Pedro      | Santos    | Pagdaraoan     |

## Benefits

| benefit_id | senior_id | benefit_type       | amount |
| ---------- | --------- | ------------------ | ------ |
| 1          | 1001      | Social Pension     | 500    |
| 2          | 1001      | Medical Assistance | 2000   |
| 3          | 1002      | Social Pension     | 500    |

Although improved, benefit types are still repeated.

---

# Second Normal Form (2NF)

Requirements:

* Must already satisfy 1NF.
* Remove partial dependencies.
* Separate data that depends on different entities.

Benefit types become their own table.

## Benefit Types

| benefit_type_id | benefit_name       |
| --------------- | ------------------ |
| 1               | Social Pension     |
| 2               | Medical Assistance |

## Benefits

| benefit_id | senior_id | benefit_type_id | amount |
| ---------- | --------- | --------------- | ------ |
| 1          | 1001      | 1               | 500    |
| 2          | 1001      | 2               | 2000   |
| 3          | 1002      | 1               | 500    |

Now benefit names are stored only once.

---

# Third Normal Form (3NF)

Requirements:

* Must satisfy 2NF.
* Remove transitive dependencies.
* Every non-key attribute depends only on the primary key.

Barangays become a separate table.

## Barangays

| barangay_id | barangay_name  |
| ----------- | -------------- |
| 1           | Santiago Norte |
| 2           | Pagdaraoan     |

## Seniors

| senior_id | first_name | last_name | barangay_id |
| --------- | ---------- | --------- | ----------- |
| 1001      | Juan       | Dela Cruz | 1           |
| 1002      | Pedro      | Santos    | 2           |

Advantages:

* Barangay names are stored once.
* Updating a barangay requires changing only one record.
* Prevents inconsistent spelling.
* Easier to maintain.

---

# Final Database Structure (3NF)

The ElderEase database will contain the following core tables:

* roles
* users
* barangays
* seniors
* benefit_types
* benefits
* appointments
* emergency_requests

These tables satisfy Third Normal Form (3NF) and provide a solid foundation for future expansion.

---

# Future Expansion

The database has been designed to support additional modules without restructuring existing tables.

Possible future tables include:

* family_members
* notifications
* audit_logs
* medical_records
* digital_ids
* announcements
* user_sessions

---

# Conclusion

By applying normalization up to Third Normal Form (3NF), ElderEase minimizes data redundancy, improves consistency, and creates a scalable database suitable for managing senior citizen services in San Fernando City, La Union.
