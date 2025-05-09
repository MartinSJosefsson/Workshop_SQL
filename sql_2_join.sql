# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM city WHERE Name LIKE "ping%" ORDER BY population ASC;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM city WHERE Name LIKE "ran%" ORDER BY population desc;
#
# 3: Count all cities
SELECT COUNT(*) AS Citycount FROM City; 
#
# 4: Get the average population of all cities
SELECT avg(population) FROM city; 
#
# 5: Get the biggest population found in any of the cities
SELECT MAX(population) FROM city; 
SELECT name, population FROM city WHERE Population = (SELECT MAX(Population) FROM City);
#
# 6: Get the smallest population found in any of the cities
SELECT MIN(population) FROM city;
SELECT name, population FROM city WHERE Population = (SELECT MIN(Population) FROM City);
#
# 7: Sum the population of all cities with a population below 10000
SELECT SUM(population) AS total_population FROM city WHERE population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(countrycode) FROM city WHERE countrycode IN ("MOZ", "VNM"); 
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT countrycode, COUNT(*) AS city_count FROM city WHERE countrycode IN ('MOZ', 'VNM') GROUP BY countrycode;
#
# 10: Get average population of cities in MOZ and VNM
SELECT AVG(population) FROM city WHERE countrycode IN ('MOZ', 'VNM');
#
# 11: Get the countrycodes with more than 200 cities
SELECT countrycode, COUNT(*) AS city_count FROM city GROUP BY countrycode HAVING COUNT(*) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT countrycode, COUNT(*) AS city_count FROM city GROUP BY countrycode HAVING COUNT(*) > 200 ORDER BY city_count DESC;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT city.Name, countrylanguage.language, city.population 
FROM City
JOIN countrylanguage 
ON city.countrycode = countrylanguage.countrycode 
WHERE population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT city.Name, countrylanguage.language, city.population 
FROM City
JOIN countrylanguage 
ON city.countrycode = countrylanguage.countrycode 
WHERE population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT city.Name, city.population 
FROM City
WHERE city.countrycode = (
SELECT city.countrycode
FROM City
WHERE city.Population IN (122199)
);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT city.Name, city.population 
FROM City
WHERE city.countrycode = (
SELECT city.countrycode
FROM City
WHERE city.Population IN (122199)
) AND city.population != 122199;
#
# 17: What are the city names in the country where Luanda is capital?
SELECT city.name
FROM city
WHERE city.countrycode LIKE (
SELECT city.countrycode
FROM city
WHERE city.name = "Luanda");
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT c.Name
FROM country cr
JOIN city c ON cr.Capital = c.ID
WHERE cr.Region = (
SELECT cr2.Region
FROM City y
JOIN country cr2 ON y.countrycode = cr2.Code
WHERE y.Name = "Yaren"
);
#
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT countrylanguage.language
FROM city
JOIN country ON city.countrycode = country.Code


WHERE city.Name = "Riga"
;
#

#
# 20: Get the name of the most populous city
SELECT city.Name
FROM City
ORDER BY population DESC
LIMIT 1;
#
#