CREATE OR REPLACE PACKAGE pkg_student_mgmt AS
    PROCEDURE enroll(p_student_id NUMBER, p_course_id NUMBER, p_year VARCHAR2, p_semester VARCHAR2, p_enrollment_id OUT NUMBER);
    PROCEDURE grade(p_enrollment_id NUMBER, p_mid NUMBER, p_final NUMBER);
    FUNCTION gpa(p_student_id NUMBER) RETURN NUMBER;
    PROCEDURE report(p_student_id NUMBER);
    PROCEDURE report_all;
END pkg_student_mgmt;
/