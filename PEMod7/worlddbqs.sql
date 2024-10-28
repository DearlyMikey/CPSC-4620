# World DB SQL Questions
/*Q1 Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.*/
SELECT Id, Name, Population FROM city limit 10;

/* Q2 Create a SQL statement to display columns Id, Name, Population from the city table and limit results to rows 31-40.*/
Select Id, Name, Population FROM city limit 30,10;

/* Q3 Create a SQL statement to find only those cities from city table whose population is larger than 2000000. */
SELECT * from city where Population > 2000000;

/*Q4 Create a SQL statement to find all city names from city table whose name begins with Be prefix. */
SELECT * from city where Name LIKE 'Be%';

/*Q5 Create a SQL statement to find only those cities from city table whose population is between 500000-1000000. */
SELECT * from city where Population BETWEEN 500000 AND 1000000;

/*Q6 Create a SQL statement to display all cities from the city table sorted by Name in ascending order. */
SELECT * FROM city ORDER BY Name ASC;

/*Q7 Create a SQL statement to find a city with the lowest population in the city table. */
SELECT * FROM city JOIN country ON (city.CountryCode = country.Code) WHERE (city.Population = (SELECT MIN(Population) from  city));

/*Q8 Create a SQL statement to find a country with the largest population in the country table. */
SELECT * FROM country where Population = (SELECT MAX(Population) from country);

/*Q9 Create a SQL statement to list all the languages spoken in the Caribbean region. */
SELECT DISTINCT countrylanguage.language from countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE Region = 'Caribbean';

/*Q10 Create a SQL statement to find the capital of Spain (ESP). */
SELECT city.Name from city JOIN country ON city.ID = country.Capital WHERE CountryCode = 'ESP';

/*Q11 Create a SQL statement to find the country with the highest life expectancy. */
SELECT * from country WHERE LifeExpectancy= (SELECT MAX(LifeExpectancy) from country);

/*Q12 Create a SQL statement to find all cities from the Europe continent. */
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Europe';

/*Q13 Create a SQL statement to update president of United States after election in 2015. */
Select * from country where Name = 'United States';
UPDATE country SET HeadOfState = 'Donald Trump' WHERE Name = 'United States';

/*Q14 Create a SQL statement to find the most populated city in the city table. */
SELECT * from city WHERE Population = (SELECT MAX(Population) from city);

/*Q15 Create a SQL statement to find the least populated city in the city table. */
SELECT * from city WHERE Population= (SELECT MIN(Population) from city);

/*Q16 Create a SQL statement to calculate number of records of the city table. */
SELECT COUNT(ID) as '# of cities' from city;

/*Q17 Create a SQL statement to get number of cities in China from the city table. */
