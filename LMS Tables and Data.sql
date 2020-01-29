CREATE DATABASE db_LibraryManagement
GO
USE db_LibraryManagement
GO

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL
);

INSERT INTO Library_Branch 
VALUES
	('Sharpstown', '1515 Grant Ave.'),
	('Central', '100 Main St.'),
	('Eastside', '1514 E. Grange St.'),
	('North', '8822 N. 178th Ave.')
;

CREATE TABLE Publisher (
	PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);
INSERT INTO Publisher
VALUES
	('ABC Publications','New York','555-555-1122')
;

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(100) NOT NULL CONSTRAINT fk_B_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Books
VALUES
	('The Lost Tribe','ABC Publications'),
	('Carrie', 'ABC Publications'),
	('The Shining', 'ABC Publications'),
	('Pride and Prejudice', 'ABC Publications'),
	('To Kill a Mockingbird', 'ABC Publications'),
	('The Great Gatsby', 'ABC Publications'),
	('One Hundred Years of Solitude', 'ABC Publications'),
	('In Cold Blood', 'ABC Publications'),
	('Wide Sargasso Sea', 'ABC Publications'),
	('Brave New World', 'ABC Publications'),
	('I Capture The Castle', 'ABC Publications'),
	('Jane Eyre', 'ABC Publications'),
	('Crime and Punishment', 'ABC Publications'),
	('The Secret History', 'ABC Publications'),
	('The Call of the Wild', 'ABC Publications'),
	('The Chrysalids', 'ABC Publications'),
	('Persuasion', 'ABC Publications'),
	('Moby-Dick', 'ABC Publications'),
	('The Lion, the Witch and the Wardrobe', 'ABC Publications'),
	('To the Lighthouse', 'ABC Publications')
;

CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_BC_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BC_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

INSERT INTO Book_Copies
VALUES
	(1, 1, 5),
	(2, 1, 6),
	(3, 1, 3),
	(4, 1, 2),
	(5, 1, 2),
	(6, 1, 2),
	(7, 1, 2),
	(8, 1, 2),
	(9, 1, 2),
	(10, 1, 2),
	(2, 2, 5),
	(3, 2, 6),
	(13, 2, 3),
	(14, 2, 2),
	(15, 2, 2),
	(16, 2, 2),
	(17, 2, 2),
	(18, 2, 2),
	(19, 2, 2),
	(20, 2, 2),
	(1, 3, 5),
	(2, 3, 6),
	(3, 3, 3),
	(4, 3, 2),
	(5, 3, 2),
	(6, 3, 2),
	(7, 3, 2),
	(8, 3, 2),
	(9, 3, 2),
	(10, 4, 2),
	(11, 4, 5),
	(12, 4, 6),
	(13, 4, 3),
	(14, 4, 2),
	(15, 4, 2),
	(16, 4, 2),
	(17, 4, 2),
	(18, 4, 2),
	(19, 4, 2),
	(20, 4, 2)
;

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BA_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(100)
);

INSERT INTO Book_Authors
VALUES
	(1, 'Mark Lee'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Jane Austin'),
	(5, 'Harper Lee'),
	(6, 'F. Scott Fitzgerald'),
	(7, 'Gabriel García Márquez'),
	(8, 'Truman Capote'),
	(9, 'Jean Rhys'),
	(10, 'Aldous Huxley'),
	(11, 'Dodie Smith'),
	(12, 'Charlotte Bronte'),
	(13, 'Fyodor Dostoevsky'),
	(14, 'Donna Tartt'),
	(15, 'Jack London'),
	(16, 'John Wyndham'),
	(17, 'Jane Austen'),
	(18, 'Herman Melville'),
	(19, 'C.S. Lewis'),
	(20, 'Virginia Woolf')
;

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(100),
	Address VARCHAR(100),
	Phone VARCHAR(50)
);

INSERT INTO Borrower
VALUES
	('Bob Brown', '123 main', '555-555-4444'),
	('John Brown', '123 main', '555-555-4444'),
	('Sue Brown', '123 main', '555-555-4444'),
	('Jack Smith', '654 38th Ave.', '123-545-8765'),
	('Jane Smith', '654 38th Ave.', '123-545-8765'),
	('Roger Johnson', '8787 55th St', '111-22-3333'),
	('Lynn Anderson', '11155 225th St', '888-44-2156'),
	('Robb Carp','8752 129th Pl SE','452-55-8104')
;

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BL_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BL_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_BL_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO Book_Loans
VALUES
	(1,1,1, '2013-10-10', '2013-11-10'),
	(2,1,1, '2013-10-10', '2013-11-10'),
	(3,1,1, '2013-10-10', '2013-11-10'),
	(4,1,1, '2013-10-10', '2013-11-10'),
	(5,1,1, '2013-10-10', '2013-11-10'),
	(6,2,2, '2013-10-14', '2013-11-14'),
	(7,2,2, '2013-10-14', '2013-11-14'),
	(8,2,2, '2013-10-14', '2013-11-14'),
	(9,2,2, '2013-10-14', '2013-11-14'),
	(10,2,2, '2013-10-14', '2013-11-14'),
	(1,2,3, '2013-10-14', '2013-11-14'),
	(2,2,3, '2013-10-14', '2013-11-14'),
	(3,2,3, '2013-10-14', '2013-11-14'),
	(4,2,3, '2013-10-14', '2013-11-14'),
	(5,2,3, '2013-10-14', '2013-11-14'),
	(6,2,3, '2013-10-14', '2013-11-14'),
	(7,2,3, '2013-10-14', '2013-11-14'),
	(8,2,3, '2013-10-14', '2013-11-14'),
	(9,2,3, '2013-10-14', '2013-11-14'),
	(10,2,3, '2013-10-14', '2013-11-14'),
	(11,2,3, '2013-10-14', '2013-11-14'),
	(12,2,3, '2013-10-14', '2013-11-14'),
	(13,2,3, '2013-10-14', '2013-11-14'),
	(14,2,3, '2013-10-14', '2013-11-14'),
	(15,2,3, '2013-10-14', '2013-11-14'),
	(16,2,3, '2013-10-14', '2013-11-14'),
	(17,2,3, '2013-10-14', '2013-11-14'),
	(18,2,3, '2013-10-14', '2013-11-14'),
	(19,2,3, '2013-10-14', '2013-11-14'),
	(20,2,3, '2013-10-14', '2013-11-14'),
	(1,3,4, '2013-10-14', '2013-11-14'),
	(2,3,4, '2013-10-14', '2013-11-14'),
	(3,3,4, '2013-10-14', '2013-11-14'),
	(4,3,4, '2013-10-14', '2013-11-14'),
	(5,3,4, '2013-10-14', '2013-11-14'),
	(6,3,4, '2013-10-14', '2013-11-14'),
	(7,3,4, '2013-10-14', '2013-11-14'),
	(8,3,4, '2013-10-14', '2013-11-14'),
	(9,3,4, '2013-10-14', '2013-11-14'),
	(10,3,4, '2013-10-14', '2013-11-14'),
	(11,3,4, '2013-10-14', '2013-11-14'),
	(12,3,4, '2013-10-14', '2013-11-14'),
	(13,3,4, '2013-10-14', '2013-11-14'),
	(14,3,4, '2013-10-14', '2013-11-14'),
	(15,3,4, '2013-10-14', '2013-11-14'),
	(16,3,4, '2013-10-14', '2013-11-14'),
	(17,3,4, '2013-10-14', '2013-11-14'),
	(18,3,4, '2013-10-14', '2013-11-14'),
	(19,3,4, '2013-10-14', '2013-11-14'),
	(20,3,4, '2013-10-14', '2013-11-14')
;