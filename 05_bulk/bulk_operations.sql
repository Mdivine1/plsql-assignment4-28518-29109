CREATE OR REPLACE TRIGGER trg_grade_audit
AFTER INSERT OR UPDATE ON grades
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO grade_audit(enrollment_id, operation, old_total, new_total)
        VALUES (:NEW.enrollment_id, 'INSERT', NULL, :NEW.total_score);
    ELSIF UPDATING THEN
        INSERT INTO grade_audit(enrollment_id, operation, old_total, new_total)
        VALUES (:NEW.enrollment_id, 'UPDATE', :OLD.total_score, :NEW.total_score);
    END IF;
END trg_grade_audit;
/