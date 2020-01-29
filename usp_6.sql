USE db_LibraryManagement
GO

CREATE PROC MoreThan5
AS
	SELECT b.Name, b.Address, COUNT(bl.CardNo) AS NumCheckouts FROM Borrower b 
	INNER JOIN Book_Loans bl ON bl.CardNo = b.CardNo
	GROUP BY b.Name, b.Address
	HAVING COUNT(bl.CardNo) > 5