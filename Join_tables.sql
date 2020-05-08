--1. Partisan data, including animal species
SELECT *
	FROM Pet p JOIN Pet_Type pt
	ON p.Pet_Type_ID = pt.Pet_Type_ID
	WHERE p.Nick = 'Partizan'
	
--2. List of all dogs with nicknames, breed and age
SELECT p.Nick, p.Breed, p.Age
	FROM Pet p JOIN Pet_Type pt
	ON p.Pet_Type_ID = pt.Pet_Type_ID 
	WHERE pt.Name = 'DOG'
	
--3. Average age of cats
	SELECT AVG(CONVERT(FLOAT,p.Age))
	FROM Pet p JOIN Pet_Type pt
	ON p.Pet_Type_ID = pt.Pet_Type_ID 
	WHERE pt.Name = 'CAT'

--4. Time and executors of outstanding orders
SELECT o1.Time_Order, p.last_name
	FROM order1 o1, Employee e, Person p
	WHERE e.Employee_ID = o1.Employee_ID AND e.Person_ID = p.Person_ID
	AND o1.Is_Done = 0

--5. List of dog owners - name, surname, telephone
SELECT prs.First_Name, prs.Last_Name, prs.Phone 
	FROM Person prs,
		 Pet p,
		 Owner ow,
		 Pet_Type pt
	WHERE prs.Person_ID = ow.Person_ID 
	AND p.Owner_ID = ow.Owner_ID 
	AND pt.Pet_Type_ID = p.Pet_Type_ID
	AND pt.Name = 'DOG'


--6. All types of pets and nicknames of representatives of these species (external connection).
SELECT pt.Name, p.Nick
	FROM Pet p RIGHT JOIN Pet_Type pt
	ON p.Pet_Type_ID = pt.Pet_Type_ID  