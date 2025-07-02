CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    admission_number TEXT NOT NULL UNIQUE,
    student_email TEXT NOT NULL UNIQUE,
    phone_number TEXT NOT NULL,
    course_name TEXT NOT NULL
);
