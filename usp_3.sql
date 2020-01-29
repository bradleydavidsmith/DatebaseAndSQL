USE db_LibraryManagement
GO

/* Create a Procedure that retrieves all borrowers that do
	 not have books checked out
*/
CREATE PROC NoBooksCheckedOut
AS
	SELECT b.Name FROM Borrower b
	WHERE b.CardNo NOT IN (SELECT DISTINCT CardNo FROM Book_Loans)



