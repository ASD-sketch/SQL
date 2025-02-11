






CREATE DATABASE SchoolManagement;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY identity,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Address TEXT
);


CREATE TABLE family_info (
    FamilyID INT PRIMARY KEY identity,
    StudentID INT,
    FatherName VARCHAR(100),
    ContactNumber VARCHAR(15),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY identity,
    CourseName VARCHAR(100) NOT NULL,
    Description VARCHAR(100),
    Resource VARCHAR(100)
);



CREATE TABLE Classes (
    ClassID INT PRIMARY KEY identity,
    CourseID INT,
    ClassCode VARCHAR(50),
    RoomNumber VARCHAR(10),
    Schedule VARCHAR(100),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY identity,
    CourseID INT,
    Name VARCHAR(100),
    Description VARCHAR(100),
    DueDate DATE,
    State VARCHAR(10) CHECK (State IN('Pass', 'Failed')),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


CREATE TABLE attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    AttendanceDate DATE,
    AbsenceType VARCHAR(10) CHECK (AbsenceType IN ('Leaving', 'Absence', 'Late')), 
    Reason VARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);




SELECT * FROM Students 
WHERE BirthDate = '2006-05-10';



SELECT * FROM Courses 
WHERE CourseName = 'Mathematics';




ALTER TABLE Students 
ADD Email VARCHAR(100);



INSERT INTO Students (Name, BirthDate, Address, Email)
VALUES ('Ali Ahmad', '2006-05-10', 'Amman, Jordan', 'ali@example.com');



SELECT s.StudentID, s.Name, f.FatherName, f.ContactNumber
FROM Students s
JOIN family_info f ON s.StudentID = f.StudentID;



CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY identity,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



SELECT s.StudentID, s.Name, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math';



SELECT s.StudentID, s.Name, a.Name AS AssignmentName, a.State
FROM Students s
JOIN Assignments a ON a.CourseID IN (
    SELECT CourseID FROM Courses WHERE CourseName = 'SQL'
)
WHERE a.State = 'Pass';




SELECT s.StudentID, s.Name, a.AttendanceDate, a.AbsenceType
FROM Students s
JOIN attendance a ON s.StudentID = a.StudentID
WHERE a.AbsenceType = 'Leaving'
AND a.AttendanceDate BETWEEN '2024-01-05' AND '2024-01-10';




INSERT INTO Students (Name, BirthDate, Address, Email) VALUES
('Ali Ahmad', '2006-05-10', 'Amman, Jordan', 'ali@example.com'),
('Sarah Khalid', '2005-12-22', 'Irbid, Jordan', 'sarah@example.com'),
('Mohammed Noor', '2007-07-15', 'Zarqa, Jordan', 'mohammed@example.com'),
('Hana Faisal', '2006-09-30', 'Aqaba, Jordan', 'hana@example.com'),
('Omar Kareem', '2005-04-18', 'Mafraq, Jordan', 'omar@example.com');



INSERT INTO family_info (StudentID, FatherName, ContactNumber) VALUES
(1, 'Ahmad Yusuf', '0791234567'),
(2, 'Khalid Mansour', '0789876543'),
(3, 'Noor Hassan', '0775558881'),
(4, 'Faisal Kareem', '0796677889'),
(5, 'Kareem Jaber', '0783322114');



INSERT INTO Courses (CourseName, Description, Resource) VALUES
('Mathematics', 'Advanced algebra and calculus', 'Textbook + Online Videos'),
('Physics', 'Mechanics and Thermodynamics', 'Lab Manual + Simulations'),
('Computer Science', 'Introduction to Programming', 'Python + Java'),
('English Literature', 'Classic and Modern Literature', 'E-Books + PDFs'),
('History', 'World History Overview', 'Lecture Notes + Videos');




INSERT INTO Classes (CourseID, ClassCode, RoomNumber, Schedule) VALUES
(1, 'MATH101', 'A101', 'Sunday & Tuesday 10:00 AM'),
(2, 'PHYS102', 'B202', 'Monday & Wednesday 1:00 PM'),
(3, 'CS103', 'C303', 'Tuesday & Thursday 11:00 AM'),
(4, 'ENG104', 'D404', 'Monday & Wednesday 9:00 AM'),
(5, 'HIST105', 'E505', 'Sunday & Thursday 2:00 PM');




INSERT INTO Assignments (CourseID, Name, Description, DueDate, State) VALUES
(1, 'Algebra Assignment', 'Solve 20 algebra problems', '2024-02-15', 'Pass'),
(2, 'Physics Experiment', 'Write a report on an experiment', '2024-02-20', 'Failed'),
(3, 'Python Project', 'Develop a simple calculator program', '2024-02-25', 'Pass'),
(4, 'Book Review', 'Summarize a novel in 500 words', '2024-02-18', 'Pass'),
(5, 'Historical Analysis', 'Analyze World War II impact', '2024-02-22', 'Failed');




INSERT INTO attendance (StudentID, AttendanceDate, AbsenceType, Reason) VALUES
(1, '2024-01-05', 'Leaving', 'Doctor appointment'),
(2, '2024-01-06', 'Absence', 'Family emergency'),
(3, '2024-01-07', 'Late', 'Traffic jam'),
(4, '2024-01-08', 'Leaving', 'Personal reason'),
(5, '2024-01-09', 'Absence', 'Sick leave');



INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(4, 4),
(5, 5);


