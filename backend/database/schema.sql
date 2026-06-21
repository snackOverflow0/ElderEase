/*
=============================================================
ElderEase Database Schema

Project:
ElderEase
Web-Based Senior Citizen Assistance and Benefits Management System

Target Client:
Office of the Senior Citizens Affairs (OSCA)
San Fernando City, La Union

Developed By:
Team ElderEase

Database:
MySQL 8+

Character Set:
utf8mb4

Collation:
utf8mb4_unicode_ci

Storage Engine:
InnoDB

=============================================================
*/

DROP DATABASE IF EXISTS elderease;

CREATE DATABASE elderease
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE elderease;

/*
=============================================================
TABLE: roles

Stores all system roles.

Version 1

• Administrator
• Staff

Future

• Senior Citizen
• Family Member

=============================================================
*/

CREATE TABLE roles (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    role_name VARCHAR(50) NOT NULL,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_role_name
    UNIQUE(role_name)

) ENGINE=InnoDB;

/*
=============================================================
TABLE: users

Stores authenticated users.

=============================================================
*/

CREATE TABLE users (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    role_id INT UNSIGNED NOT NULL,

    first_name VARCHAR(100) NOT NULL,

    middle_name VARCHAR(100),

    last_name VARCHAR(100) NOT NULL,

    suffix VARCHAR(20),

    email VARCHAR(150) NOT NULL,

    password VARCHAR(255) NOT NULL,

    contact_number VARCHAR(20),

    status ENUM(
        'Active',
        'Inactive'
    ) DEFAULT 'Active',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_users_email
        UNIQUE(email),

    CONSTRAINT fk_users_role
        FOREIGN KEY(role_id)
        REFERENCES roles(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB;

/*
=============================================================
TABLE: barangays

Stores barangays of San Fernando City.

=============================================================
*/

CREATE TABLE barangays (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    barangay_name VARCHAR(100) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_barangay
        UNIQUE(barangay_name)

) ENGINE=InnoDB;

/*
=============================================================
TABLE: seniors

Stores all registered senior citizens.

=============================================================
*/

CREATE TABLE seniors (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    barangay_id INT UNSIGNED NOT NULL,

    registered_by INT UNSIGNED NOT NULL,

    osca_id VARCHAR(50) NOT NULL,

    first_name VARCHAR(100) NOT NULL,

    middle_name VARCHAR(100),

    last_name VARCHAR(100) NOT NULL,

    suffix VARCHAR(20),

    gender ENUM(
        'Male',
        'Female'
    ) NOT NULL,

    birth_date DATE NOT NULL,

    civil_status ENUM(
        'Single',
        'Married',
        'Widowed',
        'Separated'
    ) NOT NULL,

    address TEXT NOT NULL,

    contact_number VARCHAR(20),

    emergency_contact_name VARCHAR(150),

    emergency_contact_number VARCHAR(20),

    registration_date DATE NOT NULL,

    status ENUM(
        'Active',
        'Inactive',
        'Deceased'
    ) DEFAULT 'Active',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_osca_id
        UNIQUE(osca_id),

    CONSTRAINT fk_senior_barangay
        FOREIGN KEY (barangay_id)
        REFERENCES barangays(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_registered_by
        FOREIGN KEY (registered_by)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB;