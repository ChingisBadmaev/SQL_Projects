--1. How many pets are available at the age of 1 year, 2 years, etc.
SELECT p.age, count(*) AS pet_count
	FROM Pet p, Pet_Type pt 
	WHERE p.Pet_Type_ID =  pt.Pet_Type_ID
	GROUP BY  p.Age

--2. How many cats, dogs, etc. are there at the age of 1 year, 2 years, etc.
SELECT pt.Name, p.age, count(*) AS count
	FROM Pet p, Pet_Type pt 
	WHERE p.Pet_Type_ID =  pt.Pet_Type_ID
	GROUP BY pt.Name, p.Age

--3. Types of pets whose average age is less than 6 years
SELECT pt.Name, AVG(Convert(float, p.Age))
	FROM Pet p, Pet_Type pt
	WHERE p.Pet_Type_ID = pt.Pet_Type_ID
	GROUP BY pt.Name
	HAVING AVG( p.Age) < 6

--4. Surnames of employees who completed more than 5 orders
SELECT p.Last_Name
	FROM order1 o1, Employee e, Person p
	WHERE o1.Employee_ID = e.Employee_ID AND e.Person_ID = p.Person_ID
	GROUP BY o1.Is_Done, p.Last_Name
	HAVING SUM(o1.Is_Done) > 5

--5. Returns the number of bytes used to represent the date and time of the order
SELECT DATALENGTH(o1.time_order) AS Memory_size
	FROM order1 o1
--6. Getting all the information in one column (column merging).
SELECT CONCAT(p.Last_Name, ' ', p.First_Name, ' lives at ', p.Address) AS All_information 
	FROM Person p
