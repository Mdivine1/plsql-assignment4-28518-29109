-- 00_schema/02_insert_sample_data.sql

INSERT INTO students VALUES (1, 'Aline', 'Mukamana', 'aline@uni.rw', 'Computer Science', SYSDATE);
INSERT INTO students VALUES (2, 'Eric', 'Nkurunziza', 'eric@uni.rw', 'Computer Science', SYSDATE);
INSERT INTO students VALUES (3, 'Divine', 'Uwase', 'divine@uni.rw', 'Information Systems', SYSDATE);
INSERT INTO students VALUES (4, 'Jean', 'Habimana', 'jean@uni.rw', 'Computer Science', SYSDATE);
INSERT INTO students VALUES (5, 'Kevin', 'Ishimwe', 'kevin@uni.rw', 'Information Systems', SYSDATE);

INSERT INTO courses VALUES (1, 'CSC101', 'Introduction to Programming', 3);
INSERT INTO courses VALUES (2, 'DBS201', 'Database Systems', 4);
INSERT INTO courses VALUES (3, 'MTH101', 'Discrete Mathematics', 3);
INSERT INTO courses VALUES (4, 'WEB201', 'Web Development', 3);

INSERT INTO enrollments VALUES (1, 1, 1, '2026-2027', 'SEMESTER 1', 'ACTIVE');
INSERT INTO enrollments VALUES (2, 1, 2, '2026-2027', 'SEMESTER 1', 'ACTIVE');
INSERT INTO enrollments VALUES (3, 2, 1, '2026-2027', 'SEMESTER 1', 'ACTIVE');
INSERT INTO enrollments VALUES (4, 2, 2, '2026-2027', 'SEMESTER 1', 'ACTIVE');
INSERT INTO enrollments VALUES (5, 3, 3, '2026-2027', 'SEMESTER 1', 'ACTIVE');
INSERT INTO enrollments VALUES (6, 4, 2, '2026-2027', 'SEMESTER 1', 'ACTIVE');

INSERT INTO grades VALUES (1, 1, 35, 55, 90, 'A');
INSERT INTO grades VALUES (2, 2, 30, 45, 75, 'B');
INSERT INTO grades VALUES (3, 3, 28, 40, 68, 'C');
INSERT INTO grades VALUES (4, 4, 32, 50, 82, 'A');
INSERT INTO grades VALUES (5, 5, 25, 30, 55, 'D');

COMMIT;