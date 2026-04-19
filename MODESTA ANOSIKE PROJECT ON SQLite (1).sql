/*question 1
Query a list of CITY names from STATION for cities that have an even ID number.
Print the results in any order, but exclude duplicates from the answer.*/
SELECT distinct city
FROM station 
where ID % 2 = 0

/* questin 2= 
--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u)
from STATION. Your result cannot contain duplicates.*/

SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^[aeiou].*';

--question 3
--Query the list of CITY names ending with vowels (a, e, i, o, u)
--from STATION. Your result cannot contain duplicates.
SELECT distinct city
FROM station
where city regexp '[aeiou]$';

/*question 4
--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
as both their first and last characters. Your result cannot contain duplicates.*/
SELECT distinct city
FROM station
where lower(city) regexp '^[aeiou].*[aeiou]$';

--QUESTION 5 Query the list of CITY names from STATION that do not start with vowels.
--Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
where city regexp '^[^aeiou]';

--QUESTION 6
--Query the list of CITY names from STATION that do not end with vowels. 
--Your result cannot contain duplicates.
SELECT distinct city
FROM station
where city regexp '[^aeiou]$';

--QUESTION 7 
--Query the list of CITY names from STATION that either do not
--start with vowels or do not end with vowels.
--Your result cannot contain duplicates.
SELECT distinct city
FROM station
where city regexp '^[^aeiou]|[^aeiou]$';

---QUESTION 8 Query a count of the number of cities in CITY
--having a Population larger than .
SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;

--QESTION 9
--Query the total population of all cities in CITY where District is California.demo
SELECT SUM(POPULATION)
FROM CITY
WHERE district = 'california';

--question 9
--Query the average population of all cities in CITY where District is California.demo
SELECT avg(population)
FROM city
WHERE district = 'california';

--question 10= Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT sum(city.population)
FROM city
JOIN country
on city.countrycode = country.code
WHERE country.continent = 'asia';

---question 11
--Query the Name of any student in STUDENTS who scored higher than 75
--Marks. Order your output by the last three characters of each name. 
--If two or more students both have names ending in the same last three characters 
--(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT name
FROM students
where marks > 75
ORDER by right(name, 3), ID ASC;

--question 12
--Write a query that prints a list of employee names 
--(i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name
FROM Employee
ORDER by name asc;

--qusetion 13
--Query the list of CITY names from STATION 
--that do not start with vowels and do not end with vowels.
--Your result cannot contain duplicates.
SELECT distinct city
FROM station
where city regexp '^[^aeiou]' AND city regexp '[^aeiou]$';

--question 14 
--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee 
--having a salary greater than  per month who have been employees for less than  months.
--Sort your result by ascending employee_id.
SELECT name
FROM employee
WHERE salary > 2000 and months < 10
order by employee_id ASC;

--question 15
--You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
--Ketty gives Eve a task to generate a report containing three columns:
--Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8.
--The report must be in descending order by grade -- i.e. higher grades are entered first. 
--if there is more than one student with the same grade (8-10) assigned to them,
--order those particular students by their name alphabetically. 
--Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order.
--If there is more than one student with the same grade (1-7) assigned to them, 
--order those particular students by their marks in ascending order.
SELECT 
  IF(G.grade >= 8, S.Name, NULL) AS Name,
  G.grade,
  S.Marks
FROM Students S
JOIN Grades G
 ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.grade DESC, 
         IF(G.grade >= 8, S.Name, S.Marks);

--question 16--
--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths
--(i.e.: number of characters in the name).
--If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT CITY, LENGTH(CITY) 
FROM STATION 
ORDER BY LENGTH(CITY), CITY 
LIMIT 1;

SELECT CITY, LENGTH(CITY) 
FROM STATION 
ORDER BY LENGTH(CITY) DESC, CITY 
LIMIT 1;

--question 17--
--Given the CITY and COUNTRY tables, query the names of all the continents
--(COUNTRY.Continent) and their respective average city populations (CITY.Population)
--rounded down to the nearest integer.

SELECT CO.Continent,floor(avg(C.population))
FROM CITY C
JOIN COUNTRY CO 
ON C.countrycode= CO.code
GROUP BY CO.Continent;

--question 18--
--Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT sum(population)
FROM city
WHERE countrycode= 'JPN';

--QUESTION 19-
--Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(POPULATION)-MIN(POPULATION)
FROM CITY;

--QUESTION 20--
--We define an employee's total earnings to be their monthly (SALARY*MNTHS)worked, and the maximum total earnings to be
--the maximum total earnings for any employee in the Employee table. 
--Write a query to find the maximum total earnings for all employees 
--as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

SELECT MAX(months*salary), COUNT(NAME)
FROM Employee
WHERE months * salary = (SELECT MAX(months * salary) FROM Employee);