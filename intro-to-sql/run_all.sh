#!/bin/bash
set -xe

# Create fresh database directory
rm -rf data
mkdir -p data

echo -e "\n=== CREATING TABLE ==="
sqlite3 data/students.db ".echo on" ".headers on" ".mode column" "
$(cat sql/create_table.sql)
"

echo -e "\n=== VERIFYING TABLE ==="
sqlite3 data/students.db ".schema students"

echo -e "\n=== INSERTING DATA ==="
sqlite3 data/students.db ".echo on" ".headers on" ".mode column" "
$(cat sql/insert_data.sql)
"

echo -e "\n=== READ OPERATIONS ==="
sqlite3 data/students.db ".headers on" ".mode column" "
SELECT * FROM students;
SELECT COUNT(*) as total_students FROM students;
"

echo -e "\n=== DATABASE FILE INFO ==="
ls -lh data/students.db
