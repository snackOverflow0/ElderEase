# Database Workflows

# ElderEase

## Web-Based Senior Citizen Assistance and Benefits Management System

---

# Purpose

This document describes how each major module interacts with the database. It serves as the blueprint for backend development and ensures that business rules are consistently implemented.

Current Deployment:

- San Fernando City, La Union

---

# 1. User Authentication

Actor:

Administrator / Staff

Workflow

User opens Login Page

↓

Enter Email

↓

Enter Password

↓

Validate Input

↓

Find User by Email

↓

Verify Password

↓

Account Active?

↓

Create Session

↓

Write Activity Log

↓

Redirect to Dashboard

Failure

↓

Display Error Message

Affected Tables

- users
- roles
- activity_logs

---

# 2. Register Senior Citizen

Actor

Staff

Workflow

Open Registration Form

↓

Fill Personal Information

↓

Select Barangay

↓

Validate Required Fields

↓

Check Duplicate OSCA ID

↓

Check Duplicate Name + Birth Date

↓

Save Senior Record

↓

Create Activity Log

↓

Redirect to Senior Profile

Failure

↓

Display Validation Errors

Affected Tables

- seniors
- barangays
- activity_logs

---

# 3. Update Senior Information

Actor

Staff

Workflow

Search Senior

↓

Open Profile

↓

Edit Information

↓

Validate Changes

↓

Update Record

↓

Log Activity

↓

Display Success Message

Affected Tables

- seniors
- activity_logs

---

# 4. Release Benefit

Actor

Staff

Workflow

Search Senior

↓

Open Benefit Module

↓

Select Benefit Type

↓

Enter Amount

↓

Validate Eligibility

↓

Save Benefit Transaction

↓

Log Activity

↓

Generate Receipt (Future)

Affected Tables

- benefits
- benefit_types
- seniors
- activity_logs

---

# 5. Schedule Appointment

Actor

Staff

Workflow

Search Senior

↓

Select Date

↓

Select Time

↓

Assign Staff

↓

Check Schedule Conflict

↓

Create Appointment

↓

Log Activity

Affected Tables

- appointments
- users
- seniors
- activity_logs

---

# 6. Emergency Assistance Request

Actor

Staff

Workflow

Receive Request

↓

Search Senior

↓

Enter Assistance Details

↓

Assign Staff

↓

Save Request

↓

Update Status

↓

Log Activity

Affected Tables

- emergency_requests
- seniors
- users
- activity_logs

---

# 7. Manage Announcements

Actor

Administrator

Workflow

Create Announcement

↓

Enter Title

↓

Enter Content

↓

Publish

↓

Visible on Dashboard

Affected Tables

- announcements
- activity_logs

---

# 8. Manage Users

Actor

Administrator

Workflow

Create User

↓

Assign Role

↓

Generate Password

↓

Save User

↓

Log Activity

Affected Tables

- users
- roles
- activity_logs

---

# 9. Generate Reports

Actor

Administrator / Staff

Workflow

Select Report

↓

Choose Date Range

↓

Retrieve Records

↓

Generate Summary

↓

Print / Export PDF

Affected Tables

- seniors
- benefits
- appointments
- emergency_requests

---

# 10. Logout

Actor

Administrator / Staff

Workflow

Click Logout

↓

Destroy Session

↓

Write Activity Log

↓

Redirect to Login

Affected Tables

- activity_logs