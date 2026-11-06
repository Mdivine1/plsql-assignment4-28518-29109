CREATE OR REPLACE PROCEDURE print_all_reports IS
    CURSOR c_students IS SELECT student_id FROM students ORDER BY student_id;
    v_id NUMBER;
BEGIN
    OPEN c_students;
    LOOP
        FETCH c_students INTO v_id;
        EXIT WHEN c_students%NOTFOUND;
        get_student_report(v_id);
    END LOOP;
    CLOSE c_students;
END print_all_reports;
/