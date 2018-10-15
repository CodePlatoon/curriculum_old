-- Note: We're inserting records with an id value set because we want to use
-- particular ids as foreign keys. I.e. setting the address_id for a student
-- so it references a specific address record. If we didn't specify a value
-- for the id columns, the database would choose an integer for us.

INSERT INTO addresses (id, line_1, city, state, zipcode) VALUES (1, '6232 Guiseppe Courts', 'Jamartown', 'Maryland', '49028');
INSERT INTO addresses (id, line_1, city, state, zipcode) VALUES (2, '704 Cecil Mountain', 'West Jon', 'South Dakota', '91578');
INSERT INTO addresses (id, line_1, city, state, zipcode) VALUES (3, '41613 Huel Ranch', 'Loycefort', 'Florida', '12109');
INSERT INTO addresses (id, line_1, city, state, zipcode) VALUES (4, '1397 Braden Shoals', 'New Karine', 'New York', '03913');


INSERT INTO students (id, first_name, last_name, birthdate, address_id) VALUES (1, 'Tianna', 'Lowe', '1985-02-17', 1);
INSERT INTO students (id, first_name, last_name, birthdate, address_id) VALUES (2, 'Elda', 'Sipes', '1989-08-03', 2);
INSERT INTO students (id, first_name, last_name, birthdate, address_id) VALUES (3, 'Jed', 'Kunde', '1987-01-22', 3);
INSERT INTO students (id, first_name, last_name, birthdate, address_id) VALUES (4, 'Leopold', 'Towne', '1984-10-07', NULL);
INSERT INTO students (id, first_name, last_name, birthdate, address_id) VALUES (5, 'Andre', 'Rohan', '1989-09-01', 4);

INSERT INTO classes (id, name, credits) VALUES (1, 'CS 101', 4);
INSERT INTO classes (id, name, credits) VALUES (2, 'HIST 107', 3);
INSERT INTO classes (id, name, credits) VALUES (3, 'SPAN 210', 3);
INSERT INTO classes (id, name, credits) VALUES (4, 'PHYS 218', 4);
INSERT INTO classes (id, name, credits) VALUES (5, 'ART 118', 2);


-- Tianna took HIST 107 and got a 'B'
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (1, 1, 2, 'B');
-- Tiana is taking SPAN 210
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (2, 1, 3, NULL);
-- Elda took ART 118 and got an 'A'
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (3, 1, 5, 'A');
-- Elda is taking SPAN 210
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (4, 2, 3, NULL);
-- Elda is taking CS 101
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (5, 2, 1, NULL);
-- Jed is taking CS 101
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (6, 3, 1, NULL);
-- Jed is taking HIST 107
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (7, 3, 2, NULL);
-- Leopold is taking HIST 107
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (8, 4, 2, NULL);
-- Leopold is taking CS 101
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (9, 4, 1, NULL);
-- Leopold is taking SPAN 210
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (10, 4, 3, NULL);
-- Leopold took PHYS 218 and got a 'C'
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (11, 4, 4, 'C');
-- Leopold took CS 101 and got an 'A'
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (12, 4, 1, 'A');
-- Andre took CS 101 and got an 'B'
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (13, 5, 1, 'B');
-- Andre took HIST 107 and got an 'B'
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (14, 5, 2, 'B');
-- Andre is taking SPAN 210
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (15, 5, 3, NULL);
-- Andre is taking ART 118
INSERT INTO enrollments (id, student_id, class_id, grade) VALUES (16, 5, 5, NULL);

-- Because we've inserted rows with hardcoded values for the primary key, id
-- the sequence used to generate id values for new rows is stuck at "1". So
-- we manually reset the sequences to the max value of id for each table.
SELECT setval('addresses_id_seq', (SELECT MAX(id) FROM addresses));
SELECT setval('students_id_seq', (SELECT MAX(id) FROM students));
SELECT setval('classes_id_seq', (SELECT MAX(id) FROM classes));
SELECT setval('enrollments_id_seq', (SELECT MAX(id) FROM enrollments));
