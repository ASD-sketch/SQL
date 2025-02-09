
CREATE DATABASE Library;


CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthYear INT
);


CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    PublishedYear INT,
    CopiesAvailable INT,
    BookCategory VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear) VALUES
(1, 'George', 'Orwell', 1903),
(2, 'Harper', 'Lee', 1926),
(3, 'J.K.', 'Rowling', 1965),
(4, 'F. Scott', 'Fitzgerald', 1896),
(5, 'Jane', 'Austen', 1775);


INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES
(1, '1984', 1, 1949, 10, 'Dystopian'),
(2, 'To Kill a Mockingbird', 2, 1960, 7, 'Fiction'),
(3, 'Harry Potter and the Sorcerer Stone', 3, 1997, 15, 'Fantasy'),
(4, 'The Great Gatsby', 4, 1925, 5, 'Classic'),
(5, 'Pride and Prejudice', 5, 1813, 8, 'Romance');



SELECT 
    Books.BookID, 
    Books.Title, 
    Books.PublishedYear, 
    Books.CopiesAvailable, 
    Books.BookCategory,
    (SELECT Authors.FirstName 
     FROM Authors 
     WHERE Authors.AuthorID = Books.AuthorID) AS FirstName,
    (SELECT Authors.LastName 
     FROM Authors 
     WHERE Authors.AuthorID = Books.AuthorID) AS LastName,
    (SELECT Authors.BirthYear 
     FROM Authors 
     WHERE Authors.AuthorID = Books.AuthorID) AS BirthYear
FROM Books;



UPDATE Books
SET CopiesAvailable = 12
WHERE BookID = 1;


DELETE FROM Books
WHERE BookID = 5;


SELECT COUNT(*) AS TotalBooks FROM Books;


SELECT AVG(PublishedYear) AS AveragePublicationYear FROM Books;



SELECT MAX(CopiesAvailable)
FROM Books;


SELECT MIN(Books.PublishedYear)
FROM Books;

TRUNCATE TABLE Books;


ALTER TABLE Authors
ADD Email VARCHAR(100);

ALTER TABLE Authors
ADD Phone_Number VARCHAR(15);




/*NOT implement*/
DROP TABLE Authors;


DROP DATABASE Library;
