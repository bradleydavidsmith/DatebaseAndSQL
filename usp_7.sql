USE db_LibraryManagement
GO

CREATE PROC StephenKingInCentral
AS
	SELECT b.Title, bc.Number_Of_Copies FROM Book_Copies bc
		INNER JOIN Books b ON bc.BookID=b.BookID
		INNER JOIN Library_Branch lb ON lb.BranchID=bc.BranchID
		INNER JOIN Book_Authors ba ON ba.BookID=b.BookID
		WHERE ba.AuthorName = 'Stephen King' AND
			lb.BranchName = 'Central'
