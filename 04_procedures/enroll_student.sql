CREATE OR REPLACE PROCEDURE record_grade(p_enrollment_id NUMBER, p_mid NUMBER, p_final NUMBER) IS
    v_total NUMBER;
    v_letter CHAR(1);
BEGIN
    IF p_mid < 0 OR p_mid > 50 OR p_final < 0 OR p_final > 50 THEN
        RAISE_APPLICATION_ERROR(-20020, 'Scores must be between 0 and 50');
    END IF;
    v_total := p_mid + p_final;
    IF v_total >= 80 THEN v_letter := 'A';
    ELSIF v_total >= 70 THEN v_letter := 'B';
    ELSIF v_total >= 60 THEN v_letter := 'C';
    ELSIF v_total >= 50 THEN v_letter := 'D';
    ELSE v_letter := 'F';
    END IF;
    INSERT INTO grades VALUES (p_enrollment_id, p_mid, p_final, v_total, v_letter);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Grade recorded: Total=' || v_total || ' Letter=' || v_letter);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20021, 'Grade already exists for this enrollment');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20022, 'Grade failed: ' || SQLERRM);
END record_grade;
/