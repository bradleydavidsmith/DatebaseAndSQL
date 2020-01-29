USE db_LibraryManagement
GO

/* Create a Procedure that counts the number copies branch owns
   of the book 'The Lost Tribe'.
*/
CREATE PROC LostTribesPerBranch
AS
SELECT  b.Title, lb.BranchName, bc.Number_Of_Copies FROM Library_Branch lb
LEFT JOIN Book_Copies bc ON bc.BranchID = lb.BranchID 
LEFT JOIN Books b ON b.BookID = BC.BookID 
WHERE b.Title = 'The Lost Tribe'

