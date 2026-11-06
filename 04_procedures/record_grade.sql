CREATE OR REPLACE PROCEDURE get_student_report(p_student_id NUMBER) IS
    v_name VARCHAR2(100);
    v_gpa NUMBER;
BEGIN
    SELECT first_name || ' ' || last_name INTO v_name FROM students WHERE student_id = p_student_id;
    v_gpa := get_student_gpa(p_student_id);
    DBMS_OUTPUT.PUT_LINE('--- Report for ' || v_name || ' (ID=' || p_student_id || ') ---');
    DBMS_OUTPUT.PUT_LINE('GPA = ' || v_gpa);
    FOR r IN (SELECT c.course_name, g.total_score, g.grade_letter
              FROM enrollments e JOIN courses c ON e.course_id = c.course_id
              LEFT JOIN grades g ON g.enrollment_id = e.enrollment_id
              WHERE e.student_id = p_student_id) LOOP
        DBMS_OUTPUT.PUT_LINE(r.course_name || ' | Total=' || r.total_score || ' | Grade=' || r.grade_letter);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student not found');
END get_student_report;
/