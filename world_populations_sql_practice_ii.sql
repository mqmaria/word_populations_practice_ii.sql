--3. How many entries in the countries table are from Africa?

SELECT COUNT(*) 
FROM countries 
WHERE continent = 'Africa';

--4. What was the total population of the continent of Oceania in 2005?

SELECT SUM(population_years.population)
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.continent = 'Oceania'
  AND population_years.year = '2005';
 
--5. What is the average population of countries in South America in 2003?

SELECT AVG(population_years.population)
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.continent = 'South America'
  AND population_years.year = '2003';

--6. What country had the smallest population in 2007?

SELECT population_years.country_id,
    countries.name,
    MIN(population)
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE population_years.year = '2007';

--7. What is the average population of Poland during the time period covered by this dataset?

SELECT population_years.country_id,
    countries.name,
    AVG(population)
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.name = 'Poland';

--8. How many countries have the word “The” in their name?

SELECT COUNT (*)
FROM countries
WHERE countries.name LIKE '%The%';


--9. What was the total population of each continent in 2010?

SELECT countries.continent,
    SUM(population)
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE population_years.year = 2010
GROUP BY countries.continent;