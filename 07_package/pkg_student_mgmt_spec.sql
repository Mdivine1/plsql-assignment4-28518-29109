CREATE OR REPLACE PACKAGE BODY pkg_student_mgmt AS
    PROCEDURE enroll(p_student_id NUMBER, p_course_id NUMBER, p_year VARCHAR2, p_semester VARCHAR2, p_enrollment_id OUT NUMBER) IS
    BEGIN
        enroll_student(p_student_id, p_course_id, p_year, p_semester, p_enrollment_id);
    END enroll;
    PROCEDURE grade(p_enrollment_id NUMBER, p_mid NUMBER, p_final NUMBER) IS
    BEGIN
        record_grade(p_enrollment_id, p_mid, p_final);
    END grade;
    FUNCTION gpa(p_student_id NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN get_student_gpa(p_student_id);
    END gpa;
    PROCEDURE report(p_student_id NUMBER) IS
    BEGIN
        get_student_report(p_student_id);
    END report;
    PROCEDURE report_all IS
    BEGIN
        print_all_reports;
    END report_all;
END pkg_student_mgmt;
/