# Software Requirements Specification (SRS)

# ElderEase

## Web-Based Senior Citizen Assistance and Benefits Management System

---

# Version

1.0

---

# Authors

Christopher Castelo

---

# 1. Introduction

## 1.1 Purpose

This document defines the functional and non-functional requirements for ElderEase, a web-based management system developed for the Office of Senior Citizens Affairs (OSCA).

The system aims to digitize senior citizen records, simplify benefit distribution, improve appointment scheduling, and generate reports efficiently.

---

## 1.2 Intended Users

- OSCA Administrator
- OSCA Staff

Future Versions:

- Senior Citizens
- Family Members

---

## 1.3 Technologies

Frontend

- HTML5
- CSS3
- JavaScript

Backend

- PHP

Database

- MySQL

---

# 2. Functional Requirements

## Authentication

The system shall:

- Allow users to log in.
- Allow users to log out.
- Validate credentials.
- Encrypt passwords.
- Maintain secure user sessions.

---

## Dashboard

The system shall display:

- Total registered seniors
- Active benefits
- Pending appointments
- Recent registrations
- Quick statistics

---

## Senior Citizen Management

The system shall allow users to:

- Register a senior citizen
- Edit information
- Delete records
- Search seniors
- Filter records
- View profiles

---

## Benefits Management

The system shall:

- Create benefit types
- Assign benefits
- Record benefit releases
- View benefit history

---

## Appointment Management

The system shall:

- Schedule appointments
- Edit appointments
- Cancel appointments
- Mark appointments as completed

---

## Reports

The system shall generate:

- Senior Citizen Reports
- Benefits Reports
- Appointment Reports
- Printable reports

---

## User Management

Administrator shall:

- Create staff accounts
- Update users
- Disable accounts
- Reset passwords

---

# 3. Non-Functional Requirements

## Performance

- Pages should load quickly.
- Search results should display efficiently.

---

## Security

The system shall:

- Prevent SQL Injection
- Prevent XSS attacks
- Validate all inputs
- Use password hashing
- Restrict unauthorized access

---

## Usability

The interface should be:

- Responsive
- Easy to navigate
- Beginner-friendly

---

## Reliability

The application should:

- Prevent data loss
- Handle unexpected errors gracefully

---

## Maintainability

The project shall use:

- Organized folder structure
- Modular PHP files
- External CSS
- External JavaScript

---

# 4. User Roles

## Administrator

Can:

- Manage users
- Manage seniors
- Manage benefits
- Manage appointments
- Generate reports

---

## Staff

Can:

- Register seniors
- Update records
- Manage appointments
- Assign benefits

Cannot:

- Manage users

---

# 5. Business Rules

- Every senior citizen must have a unique ID.
- Duplicate registrations are not allowed.
- Every benefit must be linked to an existing senior.
- Deleted records should be archived if possible.
- Only authenticated users can access the dashboard.

---

# 6. Assumptions

- Internet connection is available.
- Users have basic computer knowledge.
- MySQL server is operational.

---

# 7. Constraints

- HTML
- CSS
- JavaScript
- PHP
- MySQL

No frameworks will be used.

---

# 8. Future Enhancements

- QR Code IDs
- SMS Notifications
- Email Notifications
- Mobile App
- Family Portal
- Analytics Dashboard
- Audit Logs

---

# End of Document