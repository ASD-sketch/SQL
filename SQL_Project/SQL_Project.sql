CREATE DATABASE LibraryManagement ;


Create Table Categories(
ID int primary Key identity,
Name Varchar(100),
Description Varchar(100)
);


Create table Books(
ID int primary Key identity,
Title Varchar(100),
Author Varchar(100),
Genre Varchar(100),
PublicationYear Date,
AvailabilityStatus Varchar(100),
CategoriesID int,
Foreign key(CategoriesID) References Categories(ID),
);


Create table Members(
ID int primary key identity,
Name Varchar(100),
ContactInformation Varchar(100),
MembershipType Varchar(100),
RegistrationDate Date
);


Create Table Reservations(
ID int primary Key identity,
BooksID int,
MembersID int,
ReservationDate Date,
Status Varchar(100),
Foreign key(BooksID) References Books(ID),
Foreign key(MembersID) References Members(ID)
);


Create Table borrowing(
ID int primary key identity,
Borrowingdate Date,
dueDate Date,
returnDate Date,
BooksID int,
MembersID int,
Foreign key(BooksID) References Books(ID),
Foreign key(MembersID) References Members(ID)
);



Create Table librarystaff(
ID int primary key identity,
Name Varchar(100),
ContactInfo Varchar(100),
AssignedSection Varchar(100),
EmploymentDate Varchar(100)
);



INSERT INTO Categories (Name, Description) VALUES
('Fiction', 'Novels and fictional stories'),
('Science', 'Scientific books and research'),
('History', 'Books about past events and civilizations'),
('Technology', 'Books about IT and modern tech'),
('Philosophy', 'Books discussing philosophical ideas');



INSERT INTO Books (Title, Author, Genre, PublicationYear, AvailabilityStatus, CategoriesID) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '1925-04-10', 'Available', 1),
('A Brief History of Time', 'Stephen Hawking', 'Science', '1988-03-01', 'Checked Out', 2),
('The Art of War', 'Sun Tzu', 'History', '0500-01-01', 'Available', 3),
('Clean Code', 'Robert C. Martin', 'Technology', '2008-08-01', 'Available', 4),
('Beyond Good and Evil', 'Friedrich Nietzsche', 'Philosophy', '1886-10-01', 'Checked Out', 5);



INSERT INTO Members (Name, ContactInformation, MembershipType, RegistrationDate) VALUES
('Ali Ahmad', 'ali@example.com', 'Regular', '2023-01-10'),
('Sarah Khalid', 'sarah@example.com', 'Premium', '2022-05-20'),
('Mohammed Noor', 'mohammed@example.com', 'Regular', '2024-02-01'),
('Hana Faisal', 'hana@example.com', 'Premium', '2023-07-15'),
('Omar Kareem', 'omar@example.com', 'VIP', '2022-11-25');



INSERT INTO Reservations (BooksID, MembersID, ReservationDate, Status) VALUES
(7, 1, '2024-02-05', 'Pending'),
(8, 2, '2024-01-22', 'Approved'),
(9, 3, '2024-01-18', 'Cancelled'),
(10, 4, '2024-02-10', 'Pending'),
(11, 5, '2024-01-30', 'Approved');


INSERT INTO Borrowing (BorrowingDate, DueDate, ReturnDate, BooksID, MembersID) VALUES
('2024-02-01', '2024-02-15', NULL, 7, 1),
('2024-01-20', '2024-02-05', '2024-02-03', 8, 2),
('2024-02-05', '2024-02-20', NULL, 9, 3),
('2024-01-10', '2024-01-25', '2024-01-23', 10, 4),
('2024-01-28', '2024-02-12', NULL, 11, 5);




INSERT INTO LibraryStaff (Name, ContactInfo, AssignedSection, EmploymentDate) VALUES
('John Doe', 'john@example.com', 'Fiction', '2015-06-10'),
('Emma Watson', 'emma@example.com', 'Science', '2018-09-22'),
('Michael Smith', 'michael@example.com', 'History', '2020-03-15'),
('Sophia Johnson', 'sophia@example.com', 'Technology', '2017-07-05'),
('David Brown', 'david@example.com', 'Philosophy', '2016-12-01');




SELECT * 
FROM Members 
WHERE RegistrationDate = '2023-01-10';



SELECT * 
FROM Books 
WHERE Title = 'The Great Gatsby';



ALTER TABLE Members 
ADD Email VARCHAR(255);


INSERT INTO Members (Name, ContactInformation, MembershipType, RegistrationDate, Email) 
VALUES ('Omar', '9876543210', 'Student', '2024-06-05', 'Omar@gmail.com');





SELECT m.*
FROM Members m
INNER JOIN Reservations r ON m.ID = r.MembersID;



SELECT m.*
FROM Members m
INNER JOIN Borrowing b ON m.ID = b.MembersID
INNER JOIN Books bk ON b.BooksID = bk.ID
WHERE bk.Title = 'The Art of War';



SELECT m.ID, m.Name, m.ContactInformation, m.MembershipType, m.RegistrationDate, m.Email,
       b.BorrowingDate, b.DueDate, b.ReturnDate
FROM Members m
INNER JOIN Borrowing b ON m.ID = b.MembersID
INNER JOIN Books bk ON b.BooksID = bk.ID
WHERE bk.Title = 'Beyond Good and Evil';



SELECT m.*
FROM Members m
INNER JOIN Borrowing b ON m.ID = b.MembersID
WHERE b.ReturnDate < b.DueDate;



SELECT b.ID, b.Title, COUNT(br.ID) AS BorrowCount
FROM Books b
INNER JOIN Borrowing br ON b.ID = br.BooksID
GROUP BY b.ID, b.Title
HAVING COUNT(br.ID) > 3;




SELECT m.*
FROM Members m
INNER JOIN Borrowing b ON m.ID = b.MembersID
WHERE b.BorrowingDate BETWEEN '2024-01-01' AND '2024-01-10';




SELECT COUNT(*) AS AvailableBooks
FROM Books
WHERE AvailabilityStatus = 'Available';

















