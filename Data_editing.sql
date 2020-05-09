--1. 
-- An operator that adds a new individual to the PERSON table 
-- while maintaining sequential numbering of records.
-- Add a new record
INSERT INTO Person (Person_ID, Last_Name, First_Name, Phone, Address)
		VALUES ((SELECT MAX(Person_id) + 1 FROM Person), 'Krutoi', 'Vladimir',  '8-800-200-33-11', 'Pushkina, 3-11')


--2. 
-- An operator adding the mark “(s)” to the beginning of the comment for each order, 
-- the executor of which is a student.
UPDATE order1 SET Comments = '(s)' + Comments
	WHERE Employee_ID IN (SELECT e.Employee_ID 
							FROM Employee e, order1 o1
							WHERE e.Employee_ID = o1.Employee_ID
							AND e.Spec = 'student')


--3. 
-- Creating a new table in the database for storing data on documents 
-- of individuals (type and number of the document).
-- When creating a link from it to the PERSON table, 
-- specify the deletion cascading property.
CREATE TABLE Document(
	Person_ID				INTEGER			NOT NULL,
	Type_of_document		VARCHAR(20)		NOT NULL,
	Document_number			INTEGER			NOT NULL
);

ALTER TABLE Document ADD FOREIGN KEY (Person_ID)
	REFERENCES Person(Person_ID) ON DELETE CASCADE;


-- TESTING TASK 3
 
INSERT INTO Person (Person_ID, Last_Name, First_Name, Phone, Address)
		VALUES ((SELECT MAX(Person_id) + 1 FROM Person), 'Krutoi', 'Vladimir',  '8-800-200-33-11', 'Pushkina, 3-11')

INSERT INTO Person (Person_ID, Last_Name, First_Name, Phone, Address)
		VALUES ((SELECT MAX(Person_id) + 1 FROM Person), 'Makedonskiy', 'Aleksandr',  '+389-35-074775', 'Pella')


INSERT INTO Document (Person_ID, Type_of_document, Document_number)
	VALUES(11, 'passport', '567')

INSERT INTO Document (Person_ID, Type_of_document, Document_number)
	VALUES(12, 'cerf_of_dominance', 1641153779)
	
SELECT * FROM Document dc, Person ps WHERE dc.Person_ID = ps.Person_ID 

DELETE FROM Person WHERE Last_Name = 'Krutoi';

SELECT * FROM Document dc, Person ps WHERE dc.Person_ID = ps.Person_ID 


