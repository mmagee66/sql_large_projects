USE db_library
GO

CREATE PROC uspLostTribe_Sharp
AS
SELECT copies_number_of
FROM tbl_copies
INNER JOIN tbl_books ON books_BookID = tbl_copies.copies_BookID
INNER JOIN tbl_branch ON branch_BranchID = tbl_copies.copies_BranchID
WHERE books_Title = 'The Lost Tribe' AND branch_name = 'Sharpstown';

EXEC uspLostTribe_Sharp

USE db_library
GO

CREATE PROC uspTribeCopies
AS
SELECT branch_name, books_Title, copies_number_of
FROM tbl_copies
INNER JOIN tbl_books ON books_BookID = tbl_copies.copies_BookID
INNER JOIN tbl_branch ON branch_BranchID = tbl_copies.copies_BranchID
WHERE books_Title = 'The Lost Tribe';

EXEC uspTribeCopies


--left off for the day----------------------------------------------------

USE db_library
GO

CREATE PROC uspLoans
AS

SELECT t1.borrwer_name FROM tbl_Borrower t1
LEFT JOIN tbl_loans t2 ON t2.loans_CardNo = t1.borrower_CardNo
WHERE t2.loans_CardNo IS NULL

EXEC uspLoans;

CREATE PROC uspSharpDue
AS

SELECT t1.books_Title, t2.borrwer_name, t2.borrower_address FROM tbl_books t1
	INNER JOIN tbl_loans t3 ON t3.loans_BookID = t1.books_BookID
	INNER JOIN tbl_Borrower t2 ON t2.borrower_CardNo = t3.loans_CardNo
	INNER JOIN tbl_branch t4 ON t4.branch_BranchID = t3.loans_BranchID
	WHERE branch_name = 'Sharpstown' AND loans_DateDue = '2019-02-13'

EXEC uspSharpDue

CREATE PROC uspBranch#
AS

SELECT t1.branch_name, COUNT(t2.loans_BookID) AS BooksCheckedOut
FROM tbl_branch t1
INNER JOIN tbl_loans t2 ON t2.loans_BranchID = t1.branch_BranchID
GROUP BY branch_name
HAVING COUNT(t2.loans_BranchID) > 0

EXEC uspBranch#

CREATE PROC uspBorrowCount
AS


SELECT t1.borrwer_name, t1.borrower_address, COUNT(t2.loans_CardNo) AS BooksCheckedOut
FROM tbl_Borrower t1
INNER JOIN tbl_loans t2 ON t2.loans_CardNo = t1.borrower_CardNo
GROUP BY t1.borrwer_name, t1.borrower_address
HAVING COUNT(t2.loans_CardNo) > 5

EXEC uspBorrowCount

CREATE PROC uspKingCopies
AS

SELECT t1.books_Title, COUNT(t2.copies_number_of) AS NumberofCopies
FROM tbl_books t1
INNER JOIN tbl_copies t2 ON t2.copies_BookID = t1.books_BookID
INNER JOIN tbl_branch t3 ON t3.branch_BranchID = t2.copies_BranchID
INNER JOIN tbl_authors t4 ON t4.authors_BookID = t1.books_BookID
WHERE t3.branch_name = 'Central' AND t4.authors_AuthorName = 'King'
GROUP BY t1.books_Title
HAVING COUNT(t2.copies_number_of) > 0

EXEC uspKingCopies