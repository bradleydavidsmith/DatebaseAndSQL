USE db_LibraryManagement
GO

CREATE PROC BranchCheckouts
AS
SELECT lb.BranchName, COUNT(bl.BookID) FROM Library_Branch lb
INNER JOIN Book_Loans bl ON bl.BranchID = lb.BranchID
GROUP BY lb.BranchName