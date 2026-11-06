CREATE OR REPLACE PROCEDURE enroll_student(
    p_student_id NUMBER, p_course_id NUMBER, p_year VARCHAR2, p_semester VARCHAR2, p_enrollment_id OUT NUMBER) IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM enrollments
    WHERE student_id = p_student_id AND course_id = p_course_id;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Student already enrolled in this course');
    END IF;
    SELECT NVL(MAX(enrollment_id), 0) + 1 INTO p_enrollment_id FROM enrollments;
    INSERT INTO enrollments VALUES (p_enrollment_id, p_student_id, p_course_id, p_year, p_semester);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Enrolled successfully, ID=' || p_enrollment_id);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20011, 'Enroll failed: ' || SQLERRM);
END enroll_student;
/