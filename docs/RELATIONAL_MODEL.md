# Relational Model

# ElderEase

## Web-Based Senior Citizen Assistance and Benefits Management System

---

# Purpose

This document defines the relational database model of ElderEase. It identifies each table, its primary key, foreign keys, and relationships.

The database is designed for the Office of Senior Citizens Affairs (OSCA) in **San Fernando City, La Union**, while remaining scalable for future expansion.

---

# Database Tables

## roles

Purpose

Stores user roles and access levels.

Primary Key

* id

Columns

* id
* role_name
* description
* created_at
* updated_at

Relationship

One Role can have many Users.

---

## users

Purpose

Stores system users.

Primary Key

* id

Foreign Keys

* role_id → roles.id

Columns

* id
* role_id
* first_name
* last_name
* email
* password
* contact_number
* status
* created_at
* updated_at

Relationship

One User belongs to one Role.

One User can register many Senior Citizens.

One User can release many Benefits.

One User can manage many Appointments.

---

## barangays

Purpose

Stores barangays within San Fernando City.

Primary Key

* id

Columns

* id
* barangay_name
* created_at
* updated_at

Relationship

One Barangay has many Senior Citizens.

---

## seniors

Purpose

Stores senior citizen records.

Primary Key

* id

Foreign Keys

* barangay_id → barangays.id
* registered_by → users.id

Columns

* id
* barangay_id
* registered_by
* osca_id
* first_name
* middle_name
* last_name
* suffix
* gender
* birth_date
* civil_status
* address
* contact_number
* emergency_contact_name
* emergency_contact_number
* registration_date
* status
* created_at
* updated_at

Relationship

One Senior belongs to one Barangay.

One Senior is registered by one User.

One Senior can receive many Benefits.

One Senior can have many Appointments.

One Senior can submit many Emergency Requests.

---

## benefit_types

Purpose

Stores all available benefit programs.

Primary Key

* id

Columns

* id
* benefit_name
* description
* created_at
* updated_at

Relationship

One Benefit Type can be assigned many times.

---

## benefits

Purpose

Stores benefit transactions.

Primary Key

* id

Foreign Keys

* senior_id → seniors.id
* benefit_type_id → benefit_types.id
* released_by → users.id

Columns

* id
* senior_id
* benefit_type_id
* released_by
* amount
* release_date
* remarks
* created_at
* updated_at

Relationship

Many Benefits belong to one Senior.

Many Benefits belong to one Benefit Type.

Many Benefits are released by one User.

---

## appointments

Purpose

Stores appointment schedules.

Primary Key

* id

Foreign Keys

* senior_id → seniors.id
* assigned_staff → users.id

Columns

* id
* senior_id
* assigned_staff
* appointment_date
* appointment_time
* purpose
* status
* remarks
* created_at
* updated_at

Relationship

One Senior can have many Appointments.

One User can manage many Appointments.

---

## emergency_requests

Purpose

Stores emergency assistance requests.

Primary Key

* id

Foreign Keys

* senior_id → seniors.id
* assigned_staff → users.id

Columns

* id
* senior_id
* assigned_staff
* request_type
* description
* request_date
* status
* remarks
* created_at
* updated_at

Relationship

One Senior can submit many Emergency Requests.

One User can process many Emergency Requests.

---

# Relationship Summary

roles (1)

↓

users (Many)

↓

seniors (Many)

↓

benefits (Many)

↓

benefit_types (1)

---

users (1)

↓

appointments (Many)

---

users (1)

↓

emergency_requests (Many)

---

barangays (1)

↓

seniors (Many)

---

# Cardinality Summary

roles 1 —— ∞ users

users 1 —— ∞ seniors

barangays 1 —— ∞ seniors

seniors 1 —— ∞ benefits

benefit_types 1 —— ∞ benefits

users 1 —— ∞ benefits

seniors 1 —— ∞ appointments

users 1 —— ∞ appointments

seniors 1 —— ∞ emergency_requests

users 1 —— ∞ emergency_requests

---

# Database Design Principles

The relational model follows these principles:

* Third Normal Form (3NF)
* Referential Integrity
* Primary Key on every table
* Foreign Key constraints
* Consistent naming conventions
* Timestamp tracking
* Future scalability

---

# Version

1.0
