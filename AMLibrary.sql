CREATE DATABASE db_AMLibrary2
--Database Created --

--Selecting the correct Database--
USE db_AMLibrary2


--Table Creation--
CREATE TABLE PUBLISHER (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(75) NOT NULL, 
	Phone VARCHAR(25) NOT NULL 
	);

CREATE TABLE BOOK (
	BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
	Title VARCHAR(50) NOT NULL, 
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_Name FOREIGN KEY REFERENCES PUBLISHER(Name) ON UPDATE CASCADE ON DELETE CASCADE
	);

CREATE TABLE BOOK_AUTHORS (
	BookId INT NOT NULL CONSTRAINT fk_BookId FOREIGN KEY REFERENCES BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE, 
	AuthorName VARCHAR(50) NOT NULL
	); 

CREATE TABLE LIBRARY_BRANCH (
	BranchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL, 
	Address VARCHAR(50)
	);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (001,1), 
	Name VARCHAR (50) NOT NULL, 
	Address VARCHAR(50) NOT NULL, 
	Phone VARCHAR(50) NOT NULL
	); 

CREATE TABLE BOOK_COPIES (
	BookId INT NOT NULL,
	BranchId INT NOT NULL CONSTRAINT fk_BranchId FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
	);

CREATE TABLE BOOK_LOANS (
	BookId INT NOT NULL, 
	BranchId INT NOT NULL, 
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE, 
	DateOut DATE NOT NULL, 
	DueDate DATE NOT NULL 
	); 



--Information Insert-- 

INSERT INTO PUBLISHER 
	(Name, Address, Phone)
	VALUES
	('2 Chains Group', '124 N MainStreet', '909-555-0987'),
	('Lost boys Publishing', '9383 Mt Wilson Ct', '760-555-2423'),
	('Porpoise Publishers', '1090 Pacific Oce Ave', '532-555-3352'),
	('Winchesterton Press', '911 Security ln', '404-555-4534'),
	('Lenovo Publishers', '437 EDM Court', '678-555-4356'),
	('Mead, Grog and Harvey Inc.', '8566 Moustache Blvd', '555-555-5555'),
	('Augustyn and Associates', '14526 Nasturtium Way', '092-555-2341'),
	('311 Press and Publishing', '549 Hopewell Road', '651-555-2321'),
	('AJM and Company', '5486 Greensleeves', '834-555-4382'),
	('Dunder Mifflin Paper co.', '332 E. Roswell Rd', '687-555-1775'),
	('Dr. Acula press', '8433 Camp Anawana Rd.', '678-555-4545'),
	('Scholastic', '35442 Tyler Mall Cir', '381-555-4238')
	; 
	
	--Used to verify data
SELECT * FROM PUBLISHER;


INSERT INTO BOOK
	(Title, PublisherName)
	VALUES
	('Love and Marriage', '2 Chains Group'), 
	('Down with th Sickness', '2 Chains Group'), 
	('The Lost Tribe', 'Lost boys Publishing'),
	('Is there anybody out there?', 'Winchesterton Press'),
	('Commen Sense is not common', 'Lenovo Publishers'),
	('If I only had a brain', 'Lenovo Publishers'),
	('The only time I died', 'Mead, Grog and Harvey Inc.'),
	('Life after Love', 'Augustyn and Associates'), 
	('Peanut butter and Jelly after midnight', '311 Press and Publishing'), 
	('There can only be one Highlander', '311 Press and Publishing'),
	('Highlander 2', 'AJM and Company'), 
	('Why are Q-tips not a q?', 'AJM and Company'), 
	('Alex and Emma', 'AJM and Company'),
	('One upon a dream', 'Dunder Mifflin Paper co.'), 
	('Last chance for everything', 'Dunder Mifflin Paper co.'), 
	('SQL for Dummies, yes you.', 'Dr. Acula press'),
	('Was Gatsby really the great?', 'Dr. Acula press'), 
	('50 years of belly lint', 'Dr. Acula press'), 
	('Typing and why you should learn it', 'Scholastic'),
	('Top 10 fun bathroom break apps', 'Scholastic')
	;

	--Verify Data
SELECT * FROM BOOK;


INSERT INTO BOOK_AUTHORS 
	(BookId, AuthorName)
	VALUES
	('4', 'Stephen King'),
	('5', 'Alex Mrtin'), 
	('6', 'Corey Haim'), 
	('7', 'Steve Aoki'),
	('8', 'Nick Hexum'),
	('9', 'Michael Meyers'),
	('10', 'Ivana Tranquil'),
	('11', 'Spud Greensburg'),
	('12', 'Mike Keaton'),
	('13', 'Mark Zuckerberg'),
	('14', 'Tom Augustyn'),
	('15', 'Yohan Bach'),
	('16', 'Mary Tyler Moore'),
	('17', 'Chris Jaksha'),
	('18', 'Seth Meyers'),
	('19', 'Steven Odien'),
	('20', 'John Jacob'),
	('21', 'Johnny Maine'),
	('22', 'Corey Feldman'),
	('23', 'Sir. Patrick Stewart')
	;

	--Verify Data
SELECT * FROM BOOK_AUTHORS;


INSERT INTO LIBRARY_BRANCH 
	(BranchName, Address) 
	VALUES
	('Sharpstown', '486 Milliken Rd'),
	('Central', '12110 Baseline'),
	('Rancho Cucamonga', '1543 N. Mainstreet'), 
	('Alta Loma', '5690 N. Dewey Way')
	;

	--Verify Data
SELECT * FROM LIBRARY_BRANCH;


INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('Bertram Goines','268 Galvin Drive','909-555-1234'),
('Jordon Bloxham','32 Lafayette Avenue','909-555-1235'),
('Heidi Kosloski','9083 Vermont Lane','909-555-1236'),
('Lorri Faulkner','761 John St.','909-555-1237'),
('Emilia Dever','570 Railroad Dr','909-555-1238'),
('Paris Brain','9560 Blackburn Road','909-555-1239'),
('Chrissy Paschal','9069 Summerhouse Court','909-555-1240'),
('Sherilyn Graney','9 Third Avenu','909-555-1241'),
('Maureen Stephens','34 Penn Court','909-555-1242'),
('Tamiko Kullman','430 Peninsula Court','909-555-1243'),
('Wai Mccully','858 N. Golden Star Street','909-555-1244'),
('Magnolia Carte','9957 Plumb Branch Lane','909-555-1245'),
('Raven Mikell','366 Bridge Drive East 11731','909-555-1246'),
('Jennefer Gusman','622 Gainsway St.','909-555-1247'),
('Dave Bui','4 Pearl Ave.','909-555-1248'),
('Diedra Schell','9820 Lake Forest Drive','909-555-1249')
	;

	--Verify Data
SELECT * FROM BORROWER;


INSERT INTO BOOK_COPIES
	(BookId, BranchId, No_Of_Copies)
	VALUES
	('4', '2', '2'),
	('4', '3', '2'),
	('5', '4', '2'),
	('5', '2', '2'),
	('6', '3', '2'),
	('6', '1', '2'),
	('7', '4', '2'),
	('7', '3', '2'),
	('8', '2', '2'),
	('8', '1', '2'),
	('9', '3', '2'),
	('9', '3', '2'),
	('10', '1', '2'),
	('10', '2', '2'),
	('11', '1', '2'),
	('11', '4', '2'),
	('12', '2', '2'),
	('12', '4', '2'),
	('13', '1', '2'),
	('13', '4', '2'),
	('14', '2', '2'),
	('14', '1', '2'),
	('15', '4', '2'),
	('15', '2', '2'),
	('16', '1', '2'),
	('16', '4', '2'),
	('17', '2', '2'),
	('17', '1', '2'),
	('18', '2', '2'),
	('18', '4', '2'),
	('19', '2', '2'),
	('19', '1', '2'),
	('20', '2', '2'),
	('20', '1', '2'),
	('21', '4', '2'),
	('21', '3', '2'),
	('22', '4', '2'),
	('22', '3', '2'),
	('23', '2', '2'),
	('23', '2', '2')
;	

	--Verify Data
INSERT INTO BOOK_COPIES
	(BookId, BranchId, No_Of_Copies)
	VALUES
	('6', '3', '2'),
	('3', '3', '2'),
	('20', '3', '2'),
	('18', '3', '2')
	;

	--Verify Data
SELECT * FROM BOOK_COPIES;

INSERT INTO BOOK_LOANS
	(BookId, BranchId, CardNo, DateOut, DueDate)
	VALUES
	('4', '2', '2', '2017-10-07', '2017-10-14'),
	('4', '2', '3', '2017-10-06', '2017-10-13'),
	('4', '3', '7', '2017-10-01', '2017-10-07'),
	('5', '4', '8', '2017-10-07', '2017-10-14'),
	('5', '2', '2', '2017-10-11', '2017-10-18'),
	('5', '2', '4', '2017-10-12', '2017-10-19'),
	('6', '3', '5', '2017-10-11', '2017-10-17'),
	('6', '3', '8', '2017-10-10', '2017-10-17'),
	('7', '3', '16', '2017-10-07', '2017-10-14'),
	('7', '4', '4', '2017-10-07', '2017-10-14'), 
	('7', '4', '7', '2017-10-07', '2017-10-14'),
	('8', '1', '14', '2017-10-11', '2017-10-18'), 
	('8', '1', '8', '2017-10-07', '2017-10-14'),
	('8', '2', '7', '2017-10-15', '2017-10-21'),
	('8', '2', '4', '2017-10-07', '2017-10-14'),
	('9', '3', '1', '2017-10-11', '2017-10-18'),
	('9', '3', '1', '2017-10-15', '2017-10-21'),
	('9', '3', '8', '2017-10-15', '2017-10-21'),
	('10', '1', '16', '2017-10-07', '2017-10-14'), 
	('10', '1', '2', '2017-10-14', '2017-10-21'),
	('10', '2', '7', '2017-10-11', '2017-10-18'), 
	('10', '2', '1', '2017-10-08', '2017-10-15'),
	('11', '1', '8', '2017-10-12', '2017-10-19'),
	('11', '1', '2', '2017-10-11', '2017-10-18'), 
	('11', '4', '7', '2017-10-15', '2017-10-22'),
	('12', '2', '14', '2017-10-11', '2017-10-18'),
	('12', '4', '13', '2017-10-08', '2017-10-15'),
	('13', '1', '15', '2017-10-09', '2017-10-16'), 
	('13', '1', '1', '2017-10-12', '2017-10-19'),
	('13', '4', '7', '2017-10-11', '2017-10-18'),
	('13', '4', '3', '2017-10-09', '2017-10-16'),
	('14', '1', '2', '2017-10-11', '2017-10-18'),
	('14', '1', '7', '2017-10-12', '2017-10-19'),
	('14', '2', '12', '2017-10-08', '2017-10-15'),
	('15', '4', '7', '2017-10-12', '2017-10-19'),
	('15', '4', '3', '2017-10-15', '2017-10-22'),
	('16', '1', '2', '2017-10-09', '2017-10-16'),
	('16', '1', '8', '2017-10-15', '2017-10-22'),
	('16', '4', '9', '2017-10-11', '2017-10-18'),
	('17', '1', '8', '2017-10-11', '2017-10-18'),
	('18', '2', '2', '2017-10-09', '2017-10-16'),
	('18', '3', '6', '2017-10-11', '2017-10-18'),
	('19', '1', '3', '2017-10-11', '2017-10-18'),
	('19', '1', '7', '2017-10-12', '2017-10-19'),
	('19', '2', '2', '2017-10-15', '2017-10-22'),
	('20', '1', '12', '2017-10-11', '2017-10-18'),
	('20', '2', '2', '2017-10-12', '2017-10-19'),
	('21', '3', '7', '2017-10-11', '2017-10-18'),
	('22', '4', '7', '2017-10-12', '2017-10-19'),
	('23', '2', '1', '2017-10-14', '2017-10-21'),
	('23', '2', '2', '2017-10-11', '2017-10-18')
	;

/*-- Display all tables to verify information was in--*/
USE db_AMLibrary2

DECLARE @sqlText VARCHAR(MAX)
SET @sqlText = ''
SELECT @sqlText = @sqlText + ' SELECT * FROM ' + QUOTENAME(name) + CHAR(13) FROM sys.tables
EXEC(@sqlText)
GO

USE db_AMLibrary2
GO

/* -- Storwp Procedures for information recall --*/

CREATE PROC dbo.AMLibrary_Info

-- 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

SELECT 
	e.BranchName, b.Title, g.no_of_copies
	FROM dbo.LIBRARY_BRANCH e
	INNER JOIN BOOK_COPIES g ON g.BranchId=e.BranchId
	INNER JOIN BOOK b ON b.BookId=g.BookId
	WHERE e.BranchName = 'Sharpstown' AND
	b.title = 'The Lost Tribe'
	;

-- 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?	

SELECT 
	e.BranchName, b.Title, g.no_of_copies
	FROM dbo.LIBRARY_BRANCH e
	INNER JOIN BOOK_COPIES g ON g.BranchId=e.BranchId
	INNER JOIN BOOK b ON b.BookId=g.BookId
	WHERE b.title = 'The Lost Tribe' 
	ORDER BY e.BranchName ASC
	;

-- 3. Retrieve the names of all borrowers who do not have any books checked out.

SELECT
	Name
	FROM BORROWER
	WHERE CardNo NOT IN
	(SELECT CardNo FROM BOOK_LOANS)
	;
/*------------------------------------------
 4. 
 For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
    retrieve the book title, the borrower's name, and the borrower's address.
-----------------------------------------*/

SELECT
	b.Title, f.Name, f.Address
	FROM BOOK_LOANS h
	INNER JOIN BOOK b ON h.BookId = b.BookId
	INNER JOIN BORROWER f ON h.CardNo = f.CardNo
	INNER JOIN LIBRARY_BRANCH e ON h.BranchId = e.BranchId
	WHERE e.BranchName = 'Sharpstown' AND
	h.DueDate = CAST(GETDATE()AS DATE)
	; 

/*------------------------------------
5. For each library branch, retrieve the branch name
and the total number of books loaned out from that branch.
-----------------------------------*/

SELECT
	e.BranchName, SUM(g.no_of_copies) 
	FROM BOOK_COPIES g 
	INNER JOIN LIBRARY_BRANCH e ON e.BranchId = g.BranchId
	GROUP BY e.BranchName
	; 

/*------------------------
6. Retrieve the names, addresses, and number of books checked
out for all borrowers who have more than five books checked out.
-----------------------*/

SELECT 
	f.Name, f.Address, COUNT(h.CardNo) AS 'Book Total'
	FROM BORROWER f
	INNER JOIN BOOK_LOANS h ON f.CardNo = h.CardNo
	GROUP BY f.Name, f.Address 
	HAVING COUNT(f.CardNo) > '5'
	; 


/*----------------------------
7. For each book authored (or co-authored) by "Stephen King",
retrieve the title and the number of copies owned by the
library branch whose name is "Central".
-----------------------------*/

SELECT 
	b.Title, g.no_of_copies 
	FROM BOOK b
	INNER JOIN BOOK_COPIES g ON b.BookId = g.BookId
	INNER JOIN LIBRARY_BRANCH e ON g.BranchId = e.BranchId
	INNER JOIN BOOK_AUTHORS c ON b.BookId = c.BookId
	WHERE e.BranchName = 'Central' AND
	c.AuthorName = 'Stephen King'
	;
GO