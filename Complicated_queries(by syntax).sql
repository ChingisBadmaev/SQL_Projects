-- 1.All grades on orders executed by students.
SELECT o1.Mark
	FROM Order1 o1,
		 Employee e
	WHERE o1.Employee_ID = e.Employee_ID
	AND e.Spec In (SELECT Spec 
						FROM Employee
						WHERE Spec = 'student')

-- 2.Surnames of performers who have not yet received a single order.
SELECT p.Last_Name 
	FROM Person p,
		 Employee e
	WHERE p.Person_ID = e.Person_ID 
	AND e.Employee_ID NOT IN (SELECT o11.Employee_ID
								FROM order1 o11)

--3. List of orders (type of service, time, name of the contractor, pet name, name of the owner.)
SELECT  s.Name AS Type_Of_Service, 
		pn1.Last_Name AS Employee_Name,
		o1.Time_Order,
		pt.Nick, pn2.Last_Name
	FROM Service s,
		 order1 o1,
		 Employee e,
		 Pet pt,
		 Owner o,
		 Person pn1,
		 Person pn2
	WHERE s.Service_ID  = o1.Service_ID
	AND e.Employee_ID = o1.Employee_ID
	AND e.Person_ID = pn1.Person_ID
	AND o.Owner_ID = pt.Owner_ID
	AND o1.Pet_ID = pt.Pet_ID
	AND pn2.Person_ID = o.Person_ID

--4.A general list of comments available in the database.
SELECT p.Description AS	General_list_of_comments
	FROM Pet p
	WHERE p.Description IS NOT NULL AND p.Description != ''
UNION
SELECT o.Description
	FROM Owner o
	WHERE o.Description IS NOT NULL AND o.Description != ''
UNION 
SELECT o1.Comments
	FROM order1 o1
	WHERE o1.Comments IS NOT NULL AND o1.Comments != ''


