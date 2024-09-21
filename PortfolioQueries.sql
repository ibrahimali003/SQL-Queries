select * from covid_vaccinations;
select * from covidDeaths;

-- 1. Total number of COVID-19 cases per country
SELECT location, SUM(new_cases) AS total_cases
FROM CovidDeaths
GROUP BY location;

-- 2. Total number of COVID-19 deaths per country
SELECT location, SUM(new_deaths) AS total_deaths
FROM CovidDeaths
GROUP BY location;

-- 3. Countries that have the highest and lowest COVID-19 death rates
SELECT location, (SUM(new_deaths) / SUM(new_cases)) * 100 AS death_rate
FROM CovidDeaths
GROUP BY location
ORDER BY death_rate DESC;

-- 4. The daily increase in cases for a specific country (e.g., USA)
SELECT date, new_cases
FROM CovidDeaths
WHERE location = 'United States'
ORDER BY date;

-- 5. Total number of ICU patients per country
SELECT location, SUM(icu_patients) AS total_icu_patients
FROM CovidDeaths
GROUP BY location;


-- 6. Countries that had the highest number of hospitalized patients during the pandemic
SELECT location, MAX(hosp_patients) AS max_hospitalized_patients
FROM CovidDeaths
GROUP BY location
ORDER BY max_hospitalized_patients DESC;

-- 7. The average number of daily cases across all countries
SELECT AVG(new_cases) AS average_daily_cases
FROM CovidDeaths;

-- 8.The reproduction rate of COVID-19 for each country
SELECT location, AVG(reproduction_rate) AS avg_reproduction_rate
FROM CovidDeaths
GROUP BY location;

-- 9. Countries that have the highest GDP per capita, and how does this correlate with the number of COVID-19 cases
SELECT location, gdp_per_capita, SUM(new_cases) AS total_cases
FROM CovidDeaths
GROUP BY location, gdp_per_capita
ORDER BY gdp_per_capita DESC;

-- 10. The total number of COVID-19 deaths on a specific date worldwide
SELECT date, SUM(new_deaths) AS total_deaths
FROM CovidDeaths
WHERE date = 'YYYY-MM-DD'
GROUP BY date;

-- 11. The total number of COVID-19 vaccinations administered per country
SELECT location, SUM(new_vaccinations) AS total_vaccinations
FROM Covid_vaccinations
GROUP BY location;

-- 12. The percentage of the population is fully vaccinated in each country
SELECT location, (MAX(people_fully_vaccinated) / MAX(population)) * 100 AS fully_vaccinated_percentage
FROM Covid_vaccinations
GROUP BY location;

-- 13. Countries that have the highest number of vaccinations administered per 100 people
SELECT location, MAX(total_vaccinations_per_hundred) AS vaccinations_per_100
FROM Covid_vaccinations
GROUP BY location
ORDER BY vaccinations_per_100 DESC;

-- 14. The daily increase in vaccinations for a specific country (e.g., India)
SELECT date, new_vaccinations
FROM Covid_vaccinations
WHERE location = 'India'
ORDER BY date;

-- 15. The vaccination rate (daily vaccinations) over time for a specific country
SELECT date, new_vaccinations
FROM Covid_vaccinations
WHERE location = 'Country Name'
ORDER BY date;

-- 16. The number of vaccinations correlate with the number of COVID-19 cases per country
SELECT v.location, SUM(v.new_vaccinations) AS total_vaccinations, SUM(d.new_cases) AS total_cases
FROM Covid_vaccinations v
JOIN CovidDeaths d ON v.location = d.location AND v.date = d.date
GROUP BY v.location;

-- 17. The trend of booster shots administered over time for specific countries
SELECT location, date, SUM(new_vaccinations_boosters) AS total_boosters
FROM Covid_vaccinations
GROUP BY location, date
ORDER BY date;

-- 18. The country has the highest proportion of the population fully vaccinated as of the latest date
SELECT location, MAX(people_fully_vaccinated / population) * 100 AS fully_vaccinated_percentage
FROM Covi_vaccinations
GROUP BY location
ORDER BY fully_vaccinated_percentage DESC
LIMIT 1;

-- 19.The total number of vaccinations administered by continent
SELECT continent, SUM(new_vaccinations) AS total_vaccinations
FROM Covid_vaccinations
GROUP BY continent;

-- 20. Countries had the largest increase in vaccinations during the first month of 2021
SELECT location, SUM(new_vaccinations) AS total_vaccinations
FROM Covid_vaccinations
WHERE date BETWEEN '2021-01-01' AND '2021-01-31'
GROUP BY location
ORDER BY total_vaccinations DESC;










