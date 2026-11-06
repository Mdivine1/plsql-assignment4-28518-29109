CREATE OR REPLACE FUNCTION get_student_gpa(p_student_id NUMBER) RETURN NUMBER IS
    v_gpa NUMBER := 0;
    v_count NUMBER := 0;
BEGIN
    SELECT AVG(CASE grade_letter
        WHEN 'A' THEN 4
        WHEN 'B' THEN 3
        WHEN 'C' THEN 2
        WHEN 'D' THEN 1
        ELSE 0 END), COUNT(*)
    INTO v_gpa, v_count
    FROM grades g JOIN enrollments e ON g.enrollment_id = e.enrollment_id
    WHERE e.student_id = p_student_id;

    IF v_count = 0 THEN
        RETURN 0;
    END IF;
    RETURN ROUND(v_gpa, 2);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN 0;
END get_student_gpa;
/