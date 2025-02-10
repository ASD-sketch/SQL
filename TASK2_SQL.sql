CREATE DATABASE SchoolSystem;


CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);



CREATE TABLE TeacherDetails (
    DetailID INT PRIMARY KEY identity,
    TeacherID INT,
    Qualification VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY identity,
    CourseName VARCHAR(100),
    TeacherID INT,
    CourseDescription TEXT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


CREATE TABLE Students (
    StudentID INT PRIMARY KEY identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    EnrolledDate DATE,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



INSERT INTO Teachers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('John', 'Doe', 'john.doe@school.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@school.com', '123-456-7891'),
('Mark', 'Taylor', 'mark.taylor@school.com', '123-456-7892'),
('Emma', 'Watson', 'emma.watson@school.com', '123-456-7893'),
('David', 'Brown', 'david.brown@school.com', '123-456-7894');



INSERT INTO TeacherDetails (TeacherID, Qualification, HireDate, Salary)
VALUES 
(1, 'PhD in Mathematics', '2015-08-15', 60000.00),
(2, 'Master in English', '2016-07-12', 55000.00),
(3, 'PhD in Physics', '2017-06-20', 65000.00),
(4, 'Master in Chemistry', '2018-05-25', 58000.00),
(5, 'PhD in Biology', '2019-04-10', 62000.00);



INSERT INTO Courses (CourseName, TeacherID, CourseDescription)
VALUES 
('Algebra', 1, 'Introduction to Algebra'),
('English Literature', 2, 'Study of English Literature'),
('Quantum Physics', 3, 'Advanced Physics Topics'),
('Organic Chemistry', 4, 'Study of Organic Compounds'),
('Molecular Biology', 5, 'Biology at Molecular Level');



INSERT INTO Students (FirstName, LastName, Email, EnrolledDate, CourseID)
VALUES 
('Alice', 'Johnson', 'alice.johnson@student.com', '2023-01-15', 1),
('Bob', 'Williams', 'bob.williams@student.com', '2023-02-10', 2),
('Charlie', 'Brown', 'charlie.brown@student.com', '2023-03-05', 3),
('Daisy', 'Thomas', 'daisy.thomas@student.com', '2023-04-12', 4),
('Ethan', 'Garcia', 'ethan.garcia@student.com', '2023-05-20', 5);



