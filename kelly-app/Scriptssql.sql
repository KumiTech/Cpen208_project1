/*
CREATE OR REPLACE FUNCTION calculate_outstanding_fees(
    student_id_input INTEGER
)
RETURNS JSON AS $$
DECLARE
    outstanding_amount DECIMAL;
    fees_paid DECIMAL;
BEGIN
    SELECT SUM(fee_amount) INTO fees_paid
    FROM Fees
    WHERE student_id = student_id_input AND payment_status = TRUE;
    
    SELECT SUM(fee_amount) INTO outstanding_amount
    FROM Fees
    WHERE student_id = student_id_input AND payment_status = FALSE;
    
    RETURN JSON_BUILD_OBJECT(
        'student_id', student_id_input,
        'outstanding_fees', outstanding_amount - fees_paid
    );
END;
$$ LANGUAGE plpgsql;
 
 INSERT INTO staff_.Lecturers (lecture_name, course_code, course_name, email) VALUES
('Dr. Godfrey Augustus Mills',  'CPEN 206','Linear Ciircuits ','gam@ug.edu.gh'),
('Mr. Agyare Debrah','CPEN 202','Computer Systems Design','ad@ug.edu.gh'),
('Mr. John Assiamah','CPEN 208 ','Software Engineering','ja@ug.edu.gh'),
('Dr. Margaret Ansah Richardson','CPEN 204','Data Structures and Algorithms','mar@ug.edu.gh'),
('Dr. John Assiamah','CPEN 211', 'Database Systems', 'ja@ug.edu.gh'),
('Dr. John Kutor','SENG 202', 'Differential Equations','jk@ug.edu.gh'),
('Dr. Isaac Adjaye Aboagye', 'CPEN 212','Data Communications','iaa@ug.edu.gh');

 alter table staff_.teachingassistants
 drop column course_id

 INSERT INTO staff_.teachingassistants(ta_name, email, course_name) VALUES
('Alice Johnson', 'alice.johnson@gmail.com', 'Data Communications'),
('Bob Smith', 'bob.smith@gmail.com', 'Computer Systems Design'),
('Charlie Brown', 'charlie.brown@gmail.com', 'Linear Circuits'),
('Diana Prince', 'diana.prince@gmail.com', 'Software Engineering'),
('Evan Lee', 'evan.lee@gmail.com', 'Database Systems'),
('Fiona Green', 'fiona.green@gmail.com', 'Data Structures and Algorithms'),
('George White', 'george.white@gmail.com', 'Data Structures and Algorithms');

Students:
student_id (primary key, integer, auto-increment)
first_name (varchar)
last_name (varchar)
email (varchar)
.
Courses:
course_id (primary key, integer, auto-increment)
course_name (varchar)
course_code (varchar)

Enrollments:
enrollment_id (primary key, integer, auto-increment)
student_id (foreign key, references Students)
course_id (foreign key, references Courses)

Fees:
fee_id (primary key, integer, auto-increment)
student_id (foreign key, references Students)
fee_amount (decimal)
payment_status (boolean)

Lectures:
lecture_id (primary key, integer, auto-increment)
course_id (foreign key, references Courses)

TA_Assignments:
assignment_id (primary key, integer, auto-increment)
student_id (foreign key, references Students)
lecture_id (foreign key, references Lectures)

INSERT INTO student_.fees (fee_id, student_id, amount, payment_date, status)
VALUES
    (1, 1, 500.00, '2022-01-01', 'Paid'),
    (2, 2, 750.00, '2022-01-15', 'Paid'),
    (3, 3, 300.00, NULL, 'Pending'),
    (4, 4, 600.00, '2022-02-01', 'Paid'),
    (5, 5, 400.00, '2022-02-15', 'Paid'),
    (6, 6, 200.00, NULL, 'Pending'),
    (7, 7, 800.00, '2022-03-01', 'Paid'),
    (8, 8, 550.00, '2022-03-15', 'Paid'),
    (9, 9, 350.00, NULL, 'Pending'),
    (10, 10, 650.00, '2022-04-01', 'Paid'),
    (11, 11, 450.00, '2022-04-15', 'Paid'),
    (12, 12, 250.00, NULL, 'Pending'),
    (13, 13, 900.00, '2022-05-01', 'Paid'),
    (14, 14, 700.00, '2022-05-15', 'Paid'),
    (15, 15, 400.00, NULL, 'Pending'),
    (16, 16, 600.00, '2022-06-01', 'Paid'),
    (17, 17, 500.00, '2022-06-15', 'Paid'),
    (18, 18, 300.00, NULL, 'Pending'),
    (19, 19, 750.00, '2022-07-01', 'Paid'),
    (20, 20, 650.00, '2022-07-15', 'Paid'),
    (21, 21, 450.00, NULL, 'Pending'),
    (22, 22, 800.00, '2022-08-01', 'Paid'),
    (23, 23, 700.00, '2022-08-15', 'Paid'),
    (24, 24, 350.00, NULL, 'Pending'),
    (25, 25, 900.00, '2022-09-01', 'Paid'),
    (26, 26, 750.00, '2022-09-15', 'Paid'),
    (27, 27, 500.00, NULL, 'Pending'),
    (28, 28, 600.00, '2022-10-01', 'Paid'),
    (29, 29, 650.00, '2022-10-15', 'Paid'),
    (30, 30, 400.00, NULL, 'Pending')


INSERT INTO enrollments (student_id, course_id, semester, enrollment_date)
VALUES
    (1, 1, 'Fall 2024', '2024-08-20'),
    (2, 2, 'Fall 2024', '2024-08-22'),
    (3, 3, 'Fall 2024', '2024-08-25'),
    (4, 1, 'Spring 2025', '2025-01-10'),
    (5, 2, 'Spring 2025', '2025-01-12'),
    (6, 3, 'Spring 2025', '2025-01-15'),
    (7, 1, 'Fall 2024', '2024-09-01'),
    (8, 2, 'Fall 2024', '2024-09-03'),
    (9, 3, 'Fall 2024', '2024-09-05'),
    (10, 1, 'Spring 2025', '2025-01-20'),
    (11, 2, 'Spring 2025', '2025-01-22'),
    (12, 3, 'Spring 2025', '2025-01-25'),
    (13, 1, 'Fall 2024', '2024-09-10'),
    (14, 2, 'Fall 2024', '2024-09-12'),
    (15, 3, 'Fall 2024', '2024-09-15'),
    (16, 1, 'Spring 2025', '2025-02-01'),
    (17, 2, 'Spring 2025', '2025-02-03'),
    (18, 3, 'Spring 2025', '2025-02-05'),
    (19, 1, 'Fall 2024', '2024-09-20'),
    (20, 2, 'Fall 2024', '2024-09-22'),
    (21, 3, 'Fall 2024', '2024-09-25'),
    (22, 1, 'Spring 2025', '2025-02-10'),
    (23, 2, 'Spring 2025', '2025-02-12'),
    (24, 3, 'Spring 2025', '2025-02-15'),
    (25, 1, 'Fall 2024', '2024-10-01'),
    (26, 2, 'Fall 2024', '2024-10-03'),
    (27, 3, 'Fall 2024', '2024-10-05'),
    (28, 1, 'Spring 2025', '2025-02-20'),
    (29, 2, 'Spring 2025', '2025-02-22'),
    (30, 3, 'Spring 2025', '2025-02-25');