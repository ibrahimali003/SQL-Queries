-- Airline On-Time Performance Dataset

-- 1. List all flights operated by "Delta Air Lines" in 2021
SELECT * FROM airline_performance WHERE airline = 'Delta Air Lines' AND YEAR(date) = 2021;

-- 2. Find the top 10 flights with the longest delays
SELECT flightnumber, delay FROM airline_performance ORDER BY delay DESC LIMIT 10;

-- 3. What is the average delay time for each airline?
SELECT airline, AVG(delay) AS avg_delay FROM airline_performance GROUP BY airline;

-- 4. Find the number of flights that departed from "JFK" airport
SELECT COUNT(*) AS jfk_departures FROM airline_performance WHERE origin = 'JFK';

-- 5. What is the longest distance flown by any flight?
SELECT flightnumber, distance FROM airline_performance ORDER BY distance DESC LIMIT 1;

-- 6. List all flights that had a delay of more than 2 hours and a distance greater than 1000 miles
SELECT flightnumber FROM airline_performance WHERE delay > 120 AND distance > 1000;

-- 7. What is the total number of canceled flights in 2020?
SELECT COUNT(*) AS total_cancellations FROM airline_performance WHERE YEAR(date) = 2020 AND cancellation = 1;

-- 8. Find the flight with the earliest actual departure time in the dataset
SELECT flightnumber, actualdeparture FROM airline_performance ORDER BY actualdeparture ASC LIMIT 1;

-- 9. What is the average delay for flights covering distances over 500 miles?
SELECT AVG(delay) AS avg_delay FROM airline_performance WHERE distance > 500;

-- 10. List all flights that were diverted
SELECT flightnumber FROM airline_performance WHERE diverted = 1;

-- 11. Find the top 5 airlines with the highest number of cancellations
SELECT airline, COUNT(*) AS cancellations_count 
FROM airline_performance 
WHERE cancellation = 1 
GROUP BY airline 
ORDER BY cancellations_count DESC 
LIMIT 5;

-- 12. What is the average distance covered by flights from "LAX" airport?
SELECT AVG(distance) AS avg_distance FROM airline_performance WHERE origin = 'LAX';

-- 13. Which flights were canceled due to weather?
SELECT flightnumber FROM airline_performance WHERE cancellation = 1 AND cancellationreason = 'Weather';

-- 14. What percentage of flights had a delay of more than 30 minutes?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM airline_performance)) AS percentage_long_delays
FROM airline_performance 
WHERE delay > 30;

-- 15. Find the total delay time for all flights operated by "American Airlines"
SELECT SUM(delay) AS total_delay FROM airline_performance WHERE airline = 'American Airlines';

-- 16. What is the longest distance flown by any flight from the "ORD" airport?
SELECT flightnumber, distance FROM airline_performance WHERE origin = 'ORD' ORDER BY distance DESC LIMIT 1;

-- 17. List all flights with a delay greater than 1 hour but a flight distance of fewer than 500 miles
SELECT flightnumber FROM airline_performance WHERE delay > 60 AND distance < 500;

-- 18. What is the correlation between flight distance and delay time?
SELECT CORR(distance, delay) AS correlation_distance_delay FROM airline_performance;

-- 19. Find the average delay time and distance covered by flights for each airline
SELECT airline, AVG(delay) AS avg_delay, AVG(distance) AS avg_distance 
FROM airline_performance 
GROUP BY airline;

-- 20. Which 5 flights had the shortest delay but covered the longest distances?
SELECT flightnumber, delay, distance 
FROM airline_performance 
ORDER BY delay ASC, distance DESC 
LIMIT 5;
