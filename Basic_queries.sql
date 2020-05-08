--1. Partisan data
SELECT * FROM Pet WHERE Nick = 'Partizan'

--2. Nicknames and breeds of all pets, sorted by age
SELECT Age, Nick, Breed FROM Pet ORDER BY Age
--Добавил возраст

--3. Pets with at least some description
SELECT * FROM Pet WHERE (Breed IS NOT NULL OR Age IS NOT NULL OR Description IS NOT NULL)

--4. The average age of poodles
SELECT AVG(Age) FROM Pet WHERE Breed = 'poodle'

--5. Number of owners
SELECT COUNT(DISTINCT Owner_ID) FROM Pet

