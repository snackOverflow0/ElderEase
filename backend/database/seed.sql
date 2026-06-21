-- ROLES
INSERT INTO roles (role_name, description)
VALUES
('Administrator', 'Full system access'),
('Staff', 'Can manage seniors, benefits, appointments, and emergencies');

-- USERS
INSERT INTO users (
    role_id,
    first_name,
    middle_name,
    last_name,
    email,
    password,
    contact_number
)
VALUES
(
    1,
    'Christopher',
    NULL,
    'Castelo',
    'admin@elderease.com',
    '$2y$10$ReplaceThisWithRealHashLater',
    '09123456789'
),
(
    2,
    'Den Carlo',
    NULL,
    'Aquino',
    'Aquino@elderease.com',
    '$2y$10$ReplaceThisWithRealHashLater',
    '09987654321'
),
(
    3,
    'Leanne',
    NULL,
    'Soriano',
    'Soriano@elderease.com',
    '$2y$10$ReplaceThisWithRealHashLater',
    '09987654321'
);

-- BARANGAYS
INSERT INTO barangays (barangay_name)
VALUES
('Abut'),
('Apaleng'),
('Bacsil'),
('Bangbangolan'),
('Bangcusay'),
('Barangay I'),
('Barangay II'),
('Barangay III'),
('Barangay IV'),
('Baraoas'),
('Bato'),
('Catbangen'),
('Dalumpinas Este'),
('Dalumpinas Oeste'),
('Ilocanos Norte'),
('Ilocanos Sur'),
('Langcuas'),
('Lingsat'),
('Madayegdeg'),
('Mameltac'),
('Nagyubuyuban'),
('Pagdaraoan'),
('Pao Norte'),
('Pao Sur'),
('Parian'),
('Sevilla'),
('Sibuan-Otong'),
('Tanqui'),
('Tanquigan'),
('San Agustin'),
('Santiago Norte'),
('Santiago Sur');

-- SETTINGS
INSERT INTO settings
(setting_key, setting_value, description)
VALUES
('system_name','ElderEase','System Name'),
('city','San Fernando City','City'),
('province','La Union','Province'),
('office_name','Office of the Senior Citizens Affairs','Office Name'),
('system_version','1.0.0','Current Version');

-- BENEFIT_TYPES
INSERT INTO benefit_types
(
    benefit_name,
    description,
    requires_amount
)
VALUES
(
    'Social Pension',
    'Monthly financial assistance',
    TRUE
),
(
    'Medical Assistance',
    'Medical support',
    TRUE
),
(
    'Birthday Incentive',
    'Birthday cash incentive',
    TRUE
),
(
    'Burial Assistance',
    'Financial support for burial',
    TRUE
),
(
    'Free Medical Check-up',
    'Routine medical check-up',
    FALSE
),
(
    'Vaccination Program',
    'Free vaccination',
    FALSE
);