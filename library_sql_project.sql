CREATE DATABASE db_library

USE db_library

CREATE TABLE tbl_books (
	books_BookID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	books_Title VARCHAR(50) NOT NULL,
	books_PublisherName VARCHAR (30) NOT NULL CONSTRAINT fk_books_publisher FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,
	)

INSERT INTO tbl_books
	(books_Title, books_PublisherName)
	VALUES
	('The Lost Tribe', 'Picador USA'),
	('Don Quixote', 'Pearson'),
	('Ulysses', 'RELX'),
	('The Great Gatsby', 'Thomson Reuters'),
	('Moby Dick', 'Bertelsmann'),
	('Hamlet', 'Wolters Kluwer'),
	('The Odyssey', 'Grupo Planeta'),
	('War and Peace', 'Wiley'),
	('One Hundred Tears of Solitude', 'HarperCollins'),
	('The Divine Comedy', 'Scholastic'),
	('The Brothers Karamazov','Pearson'),
	('Madame Bovary', 'RELX'),
	('The Adventures of Huckleberry Finn', 'Pearson'),
	('Lolita', 'Scholastic'),
	('Crime and Punishment', 'Grupo Planeta'),
	('Wuthering Heights', 'Pearson'),
	('Pride and Prejuduce', 'Pearson'),
	('The Catcher and the Rye', 'Scholastic'),
	('The Sound of Fury', 'Grupo Planeta'),
	('Heart of Darkness', 'Grupo Planeta'),
	('The Body', 'Pearson')
	;

	CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(30) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50),
	publisher_phone VARCHAR(20)
	)

	INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Picador USA','78 Yellow Rd', '321-987-5689'),
	('Pearson','56 Jerry Ln', '654-987-5896'),
	('RELX', '74 Harper Dr', '654-987-6548'),
	('Thomson Reuters','67 FRuit Stand Ave', '456-456-4569' ),
	('Bertelsmann', '98 Skyway Hwy', '325-365-3657' ),
	('Wolters Kluwer', '98 Book Dr', '589-589-5632' ),
	('Grupo Planeta', '365 Cliffy Rd', '456-965-5896'),
	('Wiley', '67 Clifford Way', '654-654-7865' ),
	('HarperCollins', '47 Bluegrass Ln', '456-456-9624' ),
	('Scholastic', '36 Mandolin Dr', '236-258-9632')
	;

	INSERT INTO tbl_books
	(books_Title, books_PublisherName)
	VALUES
	('The Green Mile', 'Pearson');

	CREATE TABLE tbl_branch (
		branch_BranchID INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
		branch_name VARCHAR(30) NOT NULL,
		branch_address VARCHAR(50) NOT NULL
		)

	INSERT INTO tbl_branch
	(branch_name, branch_address)
	VALUES
	('Central', '456 Canyon Rd'),
	('Sharpstown', '12 5th Ave')
	;

	INSERT INTO tbl_branch
	(branch_name, branch_address)
	VALUES
	('East', '78 Oceanside Dr'),
	('Mountain Side', '689 Starry Rd')
	;

	

	CREATE TABLE tbl_Borrower (
		borrower_CardNo INT PRIMARY KEY NOT NULL IDENTITY (3000,1),
		borrwer_name VARCHAR(30) NOT NULL,
		borrower_address VARCHAR (50),
		borrower_phone VARCHAR (20)
		)

	INSERT INTO tbl_Borrower
	(borrwer_name, borrower_address, borrower_phone)
	VALUES
	('Jacquie Hill', '7 Yellow Ave', '987-654-3215'),
	('Finn Tree', '4 Blue St', '654-659-6987'),
	('Pepper Plant', '45 Sunset Blvd', '321-654-6598'),
	('Frank Forest', '98 Picnic Way', '456-456-5263'),
	('Xander Waterfall', '13 Martini Ave', '753-852-9510'),
	('Basil Cottonwood', '32 Willow Way', '256-624-9875'),
	('Shannon Shade', '67 Sunny St', '789-425-6574'),
	('Randy River', '98 Canoe Alley', '665-987-9632')
	;


	CREATE TABLE tbl_authors (
		authors_BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_books(books_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		authors_AuthorName VARCHAR (30) NOT NULL
		)

	SELECT * FROM tbl_books
		
	INSERT INTO tbl_authors
	(authors_BookID, authors_AuthorName)
	VALUES
	(1000, 'Marriott'),
	(1001, 'Cervantes'),
	(1002, 'Joyce'),
	(1003, 'Fitzgerald'),
	(1004, 'Melville'),
	(1005, 'Shakespear'),
	(1006, 'Homer'),
	(1007, 'Tolstoy'),
	(1008, 'Marquez'),
	(1009, 'Alighieri'),
	(1010, 'Dostoyevsky'),
	(1011, 'Flaubert'),
	(1012, 'Twain'),
	(1013, 'Nabokov'),
	(1014, 'Dostoyevsky'),
	(1015, 'Bronte'),
	(1016, 'Austen'),
	(1017, 'Salinger'),
	(1018, 'Faulkner'),
	(1019, 'Conrad'),
	(1020, 'King');

	INSERT INTO tbl_authors
	(authors_BookID, authors_AuthorName)
	VALUES
	(1021, 'King');

	

	CREATE TABLE tbl_copies (
		copies_BookID INT NOT NULL CONSTRAINT fk_copies_BookID FOREIGN KEY REFERENCES tbl_books(books_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		copies_BranchID INT NOT NULL CONSTRAINT fk_copies_BranchID FOREIGN KEY REFERENCES tbl_branch(branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		copies_number_of INT NOT NULL
		)

	INSERT INTO tbl_copies 
	(copies_BookID, copies_BranchID, copies_number_of)
	VALUES
	(1000, 5000, 2),
	(1000, 5001, 1),
	(1001, 5000, 1),
	(1001, 5001, 3),
	(1002, 5000, 2),
	(1002, 5001, 1),
	(1003, 5000, 0),
	(1003, 5001, 2),
	(1004, 5000, 2),
	(1004, 5001, 6),
	(1005, 5000, 3),
	(1005, 5001, 3),
	(1006, 5000, 2),
	(1006, 5001, 3),
	(1007, 5000, 4),
	(1007, 5001, 2),
	(1008, 5000, 3),
	(1008, 5001, 2),
	(1009, 5000, 4),
	(1009, 5001, 3),
	(1010, 5000, 2),
	(1010, 5001, 3),
	(1011, 5000, 1),
	(1011, 5001, 1),
	(1012, 5000, 2),
	(1012, 5001, 2),
	(1013, 5000, 3),
	(1013, 5001, 2),
	(1014, 5000, 3),
	(1014, 5001, 1),
	(1015, 5000, 2),
	(1015, 5001, 0),
	(1016, 5000, 1),
	(1016, 5001, 1),
	(1017, 5000, 2),
	(1017, 5001, 1),
	(1018, 5000, 3),
	(1018, 5001, 7),
	(1019, 5000, 2),
	(1019, 5001, 1),
	(1020, 5000, 2),
	(1020, 5001, 2);

	INSERT INTO tbl_copies 
	(copies_BookID, copies_BranchID, copies_number_of)
	VALUES
	(1000, 5003, 1),
	(1000, 5002, 2),
	(1001, 5003, 6),
	(1001, 5002, 1),
	(1002, 5003, 2),
	(1002, 5002, 1),
	(1003, 5003, 0),
	(1003, 5002, 2),
	(1004, 5003, 2),
	(1004, 5002, 6),
	(1005, 5003, 3),
	(1005, 5002, 3),
	(1006, 5003, 2),
	(1006, 5002, 3),
	(1007, 5003, 4),
	(1007, 5002, 2),
	(1008, 5003, 3),
	(1008, 5002, 2),
	(1009, 5003, 4),
	(1009, 5002, 3),
	(1010, 5003, 2),
	(1010, 5002, 3),
	(1011, 5003, 1),
	(1011, 5002, 1),
	(1012, 5003, 2),
	(1012, 5002, 2),
	(1013, 5003, 3),
	(1013, 5002, 2),
	(1014, 5003, 3),
	(1014, 5002, 1),
	(1015, 5003, 2),
	(1015, 5002, 0),
	(1016, 5003, 1),
	(1016, 5002, 1),
	(1017, 5003, 2),
	(1017, 5002, 1),
	(1018, 5003, 3),
	(1018, 5002, 0),
	(1019, 5003, 2),
	(1019, 5002, 1),
	(1020, 5003, 2),
	(1020, 5002, 2);

	INSERT INTO tbl_copies 
	(copies_BookID, copies_BranchID, copies_number_of)
	VALUES
	(1021, 5000, 1);



	CREATE TABLE tbl_loans (
			loans_BookID INT NOT NULL CONSTRAINT fk_loans_BookID FOREIGN KEY REFERENCES tbl_books(books_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
			loans_BranchID INT NOT NULL CONSTRAINT fk_loans_BranchID FOREIGN KEY REFERENCES tbl_branch(branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
			loans_CardNo INT NOT NULL CONSTRAINT fk_loans_CardNo FOREIGN KEY REFERENCES tbl_Borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
			loans_DateOut VARCHAR(12),
			loans_DateDue VARCHAR(12)
			)

	INSERT INTO tbl_loans 
	(loans_BookID, loans_BranchID, loans_CardNo, loans_DateOut, loans_DateDue)
	VALUES
	(1021, 5000, 3001, '2019-01-01', '2019-03-15'),
	(1020, 5003, 3007, '2019-01-01', '2019-03-15'),
	(1000, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1015, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1014, 5002, 3005, '2019-01-01', '2019-03-15'),
	(1009, 5002, 3005, '2019-01-01', '2019-03-15'),
	(1007, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1001, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1020, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1000, 5003, 3005, '2019-01-01', '2019-03-15'),
	(1014, 5003, 3005, '2019-01-01', '2019-03-15'),
	(1002, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1007, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1015, 5000, 3005, '2019-01-01', '2019-03-15'),
	(1021, 5002, 3005, '2019-01-01', '2019-03-15'),
	(1014, 5003, 3005, '2019-01-01', '2019-03-15'),
	(1005, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1006, 5000, 3005, '2019-01-01', '2019-03-15'),
	(1001, 5000, 3005, '2019-01-01', '2019-03-15'),
	(1011, 5000, 3007, '2019-01-01', '2019-03-15'),
	(1010, 5001, 3000, '2019-01-01', '2019-03-15'),
	(1008, 5001, 3000, '2019-01-01', '2019-03-15'),
	(1004, 5001, 3004, '2019-01-01', '2019-03-15'),
	(1002, 5002, 3006, '2019-01-01', '2019-03-15'),
	(1007, 5002, 3003, '2019-01-01', '2019-03-15'),
	(1012, 5002, 3004, '2019-01-01', '2019-03-15'),
	(1015, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1013, 5001, 3001, '2019-01-01', '2019-03-15'),
	(1014, 5001, 3001, '2019-01-01', '2019-03-15'),
	(1015, 5002, 3001, '2019-01-01', '2019-03-15'),
	(1016, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1017, 5001, 3006, '2019-01-01', '2019-03-15'),
	(1018, 5003, 3005, '2019-01-01', '2019-03-15'),
	(1019, 5003, 3004, '2019-01-01', '2019-03-15'),
	(1020, 5001, 3003, '2019-01-01', '2019-03-15'),
	(1021, 5001, 3002, '2019-01-01', '2019-03-15'),
	(1000, 5002, 3007, '2019-01-01', '2019-03-15'),
	(1001, 5000, 3007, '2019-01-01', '2019-03-15'),
	(1002, 5001, 3007, '2019-01-01', '2019-03-15'),
	(1003, 5003, 3007, '2019-01-01', '2019-03-15'),
	(1004, 5001, 3007, '2019-01-01', '2019-03-15'),
	(1005, 5001, 3007, '2019-01-01', '2019-03-15'),
	(1006, 5001, 3007, '2019-01-01', '2019-03-15'),
	(1007, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1008, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1009, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1010, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1011, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1012, 5001, 3005, '2019-01-01', '2019-03-15'),
	(1013, 5003, 3005, '2019-01-01', '2019-03-15'),
	(1014, 5000, 3005, '2019-01-01', '2019-03-15');

	


	



	 



