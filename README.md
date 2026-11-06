# Student Grade Management System - PL/SQL Project

## Students: [Divine Mahoro, Venusse Oganze] - [29109, 28518]
## Database: Oracle XE / SQL Developer

## How to Run
1. Run 01_schema/01_create_tables.sql
2. Run 02_data/01_insert_sample_data.sql
3. Run 03_functions/01_get_student_gpa.sql
4. Run 04_procedures/01_enroll_student.sql etc.
5. Run 05_bulk/01_bulk_operations.sql
6. Run 06_triggers/01_grade_audit_trigger.sql
7. Run 07_package/01_pkg_student_mgmt_spec.sql + 02_body.sql
8. Run 08_tests/test_all.sql

## Features Implemented
- Functions: get_student_gpa (with exception handling)
- Procedures: enroll_student, record_grade, get_student_report
- Explicit Cursors: print_all_reports (OPEN/FETCH/CLOSE)
- Bulk: BULK COLLECT, FORALL + SAVE EXCEPTIONS
- Trigger: trg_grade_audit (AFTER INSERT OR UPDATE)
- Package: pkg_student_mgmt (wraps all procedures)

## Test Results
- Enroll duplicate blocked: ORA-20010 correctly raised
- Grade invalid blocked: ORA-20020 correctly raised
- Bulk insert: 3 inserted, 1 duplicate failed but SAVE EXCEPTIONS continued
- Trigger: 2 audit rows (1 INSERT + 1 UPDATE)
- GPA for Student 1 (Aline): 3.3
- Total students: 9
- Total enrollments: 7
- Total grades: 7
- Total audit rows: 2

## Files
- 01_schema, 02_data, 03_functions, 04_procedures, 05_bulk, 06_triggers, 07_package, 08_tests