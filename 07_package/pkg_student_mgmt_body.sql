SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('=== FINAL TEST ===');
  DBMS_OUTPUT.PUT_LINE('1. GPA Function: ' || pkg_student_mgmt.gpa(1));
  pkg_student_mgmt.report(1);
  pkg_student_mgmt.report_all;
  bulk_update_gpa;
END;
/
SELECT COUNT(*) AS total_students FROM students;
SELECT COUNT(*) AS total_enrollments FROM enrollments;
SELECT COUNT(*) AS total_grades FROM grades;
SELECT COUNT(*) AS total_audit_rows FROM grade_audit;
SELECT * FROM grade_audit ORDER BY audit_id;