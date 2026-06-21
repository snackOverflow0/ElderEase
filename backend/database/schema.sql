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

/*
=============================================================
TABLE: benefit_types

Stores all available senior citizen benefit programs.

=============================================================
*/

CREATE TABLE benefit_types (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    benefit_name VARCHAR(100) NOT NULL,

    description TEXT,

    is_active BOOLEAN DEFAULT TRUE,

    requires_amount BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_benefit_name
        UNIQUE (benefit_name)

) ENGINE=InnoDB;

/*
=============================================================
TABLE: benefits

Stores every benefit released to a senior citizen.

=============================================================
*/

CREATE TABLE benefits (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    senior_id INT UNSIGNED NOT NULL,

    benefit_type_id INT UNSIGNED NOT NULL,

    released_by INT UNSIGNED NOT NULL,

    amount DECIMAL(10,2) NOT NULL,

    release_date DATE NOT NULL,

    remarks TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_benefit_senior
        FOREIGN KEY (senior_id)
        REFERENCES seniors(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_benefit_type
        FOREIGN KEY (benefit_type_id)
        REFERENCES benefit_types(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_released_by
        FOREIGN KEY (released_by)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB;

/*
=============================================================
TABLE: appointments

Stores appointments requested or scheduled for senior citizens.

=============================================================
*/

CREATE TABLE appointments (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    senior_id INT UNSIGNED NOT NULL,

    assigned_staff INT UNSIGNED,

    appointment_date DATE NOT NULL,

    appointment_time TIME NOT NULL,

    purpose VARCHAR(255) NOT NULL,

    status ENUM(
        'Pending',
        'Approved',
        'Completed',
        'Cancelled'
    ) DEFAULT 'Pending',

    remarks TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_appointment_senior
        FOREIGN KEY (senior_id)
        REFERENCES seniors(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_appointment_staff
        FOREIGN KEY (assigned_staff)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL

) ENGINE=InnoDB;

/*
=============================================================
TABLE: emergency_requests

Stores emergency assistance requests submitted by or for
senior citizens.

=============================================================
*/

CREATE TABLE emergency_requests (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    senior_id INT UNSIGNED NOT NULL,

    assigned_staff INT UNSIGNED,

    request_type ENUM(
        'Medical',
        'Transportation',
        'Food Assistance',
        'Financial Assistance',
        'Rescue',
        'Other'
    ) NOT NULL,

    description TEXT NOT NULL,

    request_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    status ENUM(
        'Pending',
        'In Progress',
        'Resolved',
        'Cancelled'
    ) DEFAULT 'Pending',

    remarks TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_emergency_senior
        FOREIGN KEY (senior_id)
        REFERENCES seniors(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_emergency_staff
        FOREIGN KEY (assigned_staff)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL

) ENGINE=InnoDB;

/*
=============================================================
TABLE: announcements

Stores announcements displayed on the dashboard.

=============================================================
*/

CREATE TABLE announcements (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(200) NOT NULL,

    content TEXT NOT NULL,

    posted_by INT UNSIGNED NOT NULL,

    publish_date DATE NOT NULL,

    expiration_date DATE,

    status ENUM(
        'Draft',
        'Published',
        'Archived'
    ) DEFAULT 'Draft',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_announcement_user
        FOREIGN KEY (posted_by)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB;

/*
=============================================================
TABLE: activity_logs

Stores user activity for auditing.

=============================================================
*/

CREATE TABLE activity_logs (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNSIGNED NOT NULL,

    activity VARCHAR(255) NOT NULL,

    description TEXT,

    ip_address VARCHAR(45),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_activity_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB;

/*
=============================================================
TABLE: announcements

Stores announcements displayed on the dashboard.

=============================================================
*/

CREATE TABLE announcements (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(200) NOT NULL,

    content TEXT NOT NULL,

    posted_by INT UNSIGNED NOT NULL,

    publish_date DATE NOT NULL,

    expiration_date DATE,

    status ENUM(
        'Draft',
        'Published',
        'Archived'
    ) DEFAULT 'Draft',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_announcement_user
        FOREIGN KEY (posted_by)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB;

/*
=============================================================
TABLE: settings

Stores configurable system settings.

=============================================================
*/

CREATE TABLE settings (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    setting_key VARCHAR(100) NOT NULL,

    setting_value TEXT NOT NULL,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_setting_key
        UNIQUE(setting_key)

) ENGINE=InnoDB;