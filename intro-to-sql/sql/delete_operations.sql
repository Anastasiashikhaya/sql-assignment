-- Delete students with IDs between 10 and 15
DELETE FROM students
WHERE student_id BETWEEN 10 AND 15;

-- Remove admission_number column (SQlite workaround)
CREATE TABLE students_temp (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    student_email TEXT NOT NULL UNIQUE,
    mobile_number TEXT NOT NULL,
    course_name TEXT NOT NULL,
    technical_mentor TEXT NOT NULL DEFAULT 'Ian',
    age INTEGER CHECK (age >= 18)
);

INSERT INTO students_temp (id, first_name, last_name, student_email, mobile_number, course_name, technical_mentor, age)
SELECT id, first_name, last_name, student_email, mobile_number, course_name, technical_mentor, age FROM students;

DROP TABLE students;
ALTER TABLE students_temp RENAME TO students;

