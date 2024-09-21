-- World Population Dataset

-- 1. List all data for the country "India" in the year 2020
SELECT * FROM world_population WHERE country = 'India' AND year = 2020;

-- 2. Find the top 10 countries with the highest population in 2021
SELECT country, population FROM world_population WHERE year = 2021 ORDER BY population DESC LIMIT 10;

-- 3. What is the average life expectancy for each continent?
SELECT continent, AVG(lifeexpectancy) AS avg_life_expectancy FROM world_population GROUP BY continent;

-- 4. Find the number of countries with a population greater than 100 million in 2020
SELECT COUNT(*) AS countries_over_100m FROM world_population WHERE population > 100000000 AND year = 2020;

-- 5. What is the country with the highest GDP in 2019?
SELECT country, gdp FROM world_population WHERE year = 2019 ORDER BY gdp DESC LIMIT 1;

-- 6. List all countries that have a fertility rate of less than 2 and a life expectancy greater than 75 years in 2020
SELECT country FROM world_population WHERE fertilityrate < 2 AND lifeexpectancy > 75 AND year = 2020;

-- 7. What is the total population of all countries in 2019?
SELECT SUM(population) AS total_population FROM world_population WHERE year = 2019;

-- 8. Find the country with the lowest population density in 2020
SELECT country, density FROM world_population WHERE year = 2020 ORDER BY density ASC LIMIT 1;

-- 9. What is the average GDP for countries with a population greater than 50 million?
SELECT AVG(gdp) AS avg_gdp FROM world_population WHERE population > 50000000;

-- 10. List all countries in "Asia" that have a median age above 35 in 2020
SELECT country FROM world_population WHERE continent = 'Asia' AND medianage > 35 AND year = 2020;

-- 11. Find the top 5 countries with the highest life expectancy
SELECT country, lifeexpectancy FROM world_population ORDER BY lifeexpectancy DESC LIMIT 5;

-- 12. What is the average fertility rate of countries in the "Europe" continent in 2020?
SELECT AVG(fertilityrate) AS avg_fertility_rate FROM world_population WHERE continent = 'Europe' AND year = 2020;

-- 13. Which countries had a GDP greater than $1 trillion in 2020?
SELECT country FROM world_population WHERE gdp > 1000000000000 AND year = 2020;

-- 14. What percentage of countries had a life expectancy higher than 70 years in 2020?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM world_population WHERE year = 2020)) AS percentage_high_life_expectancy
FROM world_population 
WHERE lifeexpectancy > 70 AND year = 2020;

-- 15. Find the total urban population percentage of all countries in "North America" in 2020
SELECT SUM(urbanpopulation) AS total_urban_population FROM world_population WHERE continent = 'North America' AND year = 2020;

-- 16. What is the highest fertility rate among countries in "Africa" in 2020?
SELECT country, fertilityrate FROM world_population WHERE continent = 'Africa' AND year = 2020 ORDER BY fertilityrate DESC LIMIT 1;

-- 17. List all countries that have both a population density of more than 300 and a GDP of less than $500 billion in 2020
SELECT country FROM world_population WHERE density > 300 AND gdp < 500000000000 AND year = 2020;

-- 18. What is the correlation between GDP and life expectancy?
SELECT CORR(gdp, lifeexpectancy) AS correlation_gdp_life_expectancy FROM world_population;

-- 19. Find the average population, GDP, and life expectancy by continent in 2020
SELECT continent, AVG(population) AS avg_population, AVG(gdp) AS avg_gdp, AVG(lifeexpectancy) AS avg_life_expectancy 
FROM world_population 
WHERE year = 2020 
GROUP BY continent;

-- 20. Which 5 countries had the lowest life expectancy but the highest GDP in 2020?
SELECT country, lifeexpectancy, gdp 
FROM world_population 
WHERE year = 2020 
ORDER BY lifeexpectancy ASC, gdp DESC 
LIMIT 5;
