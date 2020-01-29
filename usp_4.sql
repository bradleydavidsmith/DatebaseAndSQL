USE db_LibraryManagement
GO

/* To have this routine return data, run this statement:
UPDATE Book_Loans
SET DateOut = CAST(GETDATE()-30 AS DATE), DateDue = CAST(GETDATE() AS DATE)
WHERE CardNo = 1;

(Also in the data loading sql file)
*/

/* Retrieve all the Books due today at the Sharpstown Branch */
CREATE PROC BooksDueTodayAtSharpstown
AS
SELECT b.Title, br.Name, br.Address FROM Books b
INNER JOIN Book_Copies bc ON b.BookID = bc.BookID
INNER JOIN Library_Branch lb ON lb.BranchID = bc.BranchID
INNER JOIN Book_Loans bl ON b.BookID = bl.BookID
INNER JOIN Borrower br ON br.CardNo = bl.CardNo
WHERE lb.BranchName = 'Sharpstown' AND bl.DateDue=CAST(GETDATE() AS DATE)


