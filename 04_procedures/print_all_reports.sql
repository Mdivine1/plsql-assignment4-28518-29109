CREATE OR REPLACE PROCEDURE bulk_insert_students IS
    TYPE t_id IS TABLE OF NUMBER;
    TYPE t_name IS TABLE OF VARCHAR2(50);
    v_ids t_id := t_id(7, 8, 9, 1);
    v_first t_name := t_name('Alice', 'Bob', 'Carol', 'Duplicate');
    v_last t_name := t_name('Kamanzi', 'Mugisha', 'Tuyisenge', 'Test');
    v_emails t_name := t_name('alice@gmail.com', 'bob@gmail.com', 'carol@gmail.com', 'aline@gmail.com');
BEGIN
    FORALL i IN 1..v_ids.COUNT SAVE EXCEPTIONS
        INSERT INTO students(student_id, first_name, last_name, email) VALUES (v_ids(i), v_first(i), v_last(i), v_emails(i));
    DBMS_OUTPUT.PUT_LINE('Bulk insert done');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Some rows failed but others continued. Errors: ' || SQL%BULK_EXCEPTIONS.COUNT);
        FOR i IN 1..SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Index ' || SQL%BULK_EXCEPTIONS(i).ERROR_INDEX || ' Error ' || SQL%BULK_EXCEPTIONS(i).ERROR_CODE);
        END LOOP;
END bulk_insert_students;
/

CREATE OR REPLACE PROCEDURE bulk_update_gpa IS
    TYPE t_id IS TABLE OF NUMBER;
    v_ids t_id;
BEGIN
    SELECT student_id BULK COLLECT INTO v_ids FROM students;
    FORALL i IN 1..v_ids.COUNT
        UPDATE students SET gpa = get_student_gpa(v_ids(i)) WHERE student_id = v_ids(i);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bulk GPA update done for ' || v_ids.COUNT || ' students');
END bulk_update_gpa;
/