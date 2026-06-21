# Entity Relationship Diagram (ERD)

# ElderEase

## Web-Based Senior Citizen Assistance and Benefits Management System

---

## Project Scope

Current deployment:

- San Fernando City, La Union

Future expansion:

- Multi-LGU support

---

## Entity Relationship Diagram

```mermaid
erDiagram

    ROLES ||--o{ USERS : has

    USERS ||--o{ SENIORS : registers

    BARANGAYS ||--o{ SENIORS : belongs_to

    USERS ||--o{ BENEFITS : releases

    BENEFIT_TYPES ||--o{ BENEFITS : categorizes

    SENIORS ||--o{ BENEFITS : receives

    USERS ||--o{ APPOINTMENTS : manages

    SENIORS ||--o{ APPOINTMENTS : schedules

    USERS ||--o{ EMERGENCY_REQUESTS : handles

    SENIORS ||--o{ EMERGENCY_REQUESTS : creates

    ROLES {
        int id PK
        string role_name
    }

    USERS {
        int id PK
        int role_id FK
        string first_name
        string last_name
        string email
        string password
    }

    BARANGAYS {
        int id PK
        string barangay_name
    }

    SENIORS {
        int id PK
        int user_id FK
        int barangay_id FK
        int registered_by FK
        string osca_id
        string first_name
        string last_name
    }

    BENEFIT_TYPES {
        int id PK
        string benefit_name
    }

    BENEFITS {
        int id PK
        int senior_id FK
        int benefit_type_id FK
        int released_by FK
        decimal amount
    }

    APPOINTMENTS {
        int id PK
        int senior_id FK
        int assigned_staff FK
        date appointment_date
        string status
    }

    EMERGENCY_REQUESTS {
        int id PK
        int senior_id FK
        int assigned_staff FK
        string request_type
        string status
    }
```

---

## Database Design Principles

- Third Normal Form (3NF)
- Referential Integrity
- Foreign Key Constraints
- Scalable Architecture
- Timestamp Tracking
- Future-ready for Senior Citizen Portal

---

## Version

1.1