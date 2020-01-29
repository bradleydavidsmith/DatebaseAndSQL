USE db_LibraryManagement
GO

/* Create a Procedure that counts the number copies the 'Sharpstown' branch owns
   of the book 'The Lost Tribe'.
*/
CREATE PROC LostTribesAtSharpstown
AS
SELECT b.Title, lb.BranchName, bc.Number_Of_Copies FROM Books b
	INNER JOIN Book_Copies bc ON b.BookID = BC.BookID
	INNER JOIN Library_Branch lb ON bc.BranchID = lb.BranchID
WHERE b.Title = 'The Lost Tribe' AND lb.BranchName='Sharpstown';