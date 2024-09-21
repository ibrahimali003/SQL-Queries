-- This dataset is from a open database from Kaggle called "IMDb Movies Dataset", which contains information on movies from IMDb

-- 1. List all movies released in the year 2020
SELECT * FROM movies WHERE year = 2020;

-- 2. Find the top 10 highest-rated movies
SELECT title, rating FROM movies ORDER BY rating DESC LIMIT 10;

-- 3. What is the average movie duration for each genre?
SELECT genre, AVG(duration) AS avg_duration FROM movies GROUP BY genre;

-- 4. Find the number of movies directed by Christopher Nolan
SELECT COUNT(*) AS nolan_movies FROM movies WHERE director = 'Christopher Nolan';

-- 5. What is the highest-grossing movie in the dataset?
SELECT title, gross FROM movies ORDER BY gross DESC LIMIT 1;

-- 6. List all movies that have a rating higher than 8.5 and grossed over $1 billion
SELECT title FROM movies WHERE rating > 8.5 AND gross > 1000000000;

-- 7. What is the total number of movies released between 2010 and 2020?
SELECT COUNT(*) AS movies_count FROM movies WHERE year BETWEEN 2010 AND 2020;

-- 8. Find the movie with the longest duration
SELECT title, duration FROM movies ORDER BY duration DESC LIMIT 1;

-- 9. What is the average IMDb rating for movies with over 100,000 votes?
SELECT AVG(rating) AS avg_rating FROM movies WHERE votes > 100000;

-- 10. List all movies in the "Comedy" genre that have a rating of 7 or higher
SELECT title FROM movies WHERE genre = 'Comedy' AND rating >= 7;

-- 11. Find the top 5 most prolific directors (who directed the most movies)
SELECT director, COUNT(*) AS movie_count 
FROM movies 
GROUP BY director 
ORDER BY movie_count DESC 
LIMIT 5;

-- 12. What is the average budget of movies released in 2015?
SELECT AVG(budget) AS avg_budget FROM movies WHERE year = 2015;

-- 13. Which movies were produced in more than one country?
SELECT title, country FROM movies WHERE country LIKE '%,%';

-- 14. What percentage of movies have a rating higher than 8.0?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM movies)) AS percentage_high_rating
FROM movies 
WHERE rating > 8.0;

-- 15. Find the total box office gross of all movies directed by Steven Spielberg
SELECT SUM(gross) AS total_gross FROM movies WHERE director = 'Steven Spielberg';

-- 16. What is the highest-rated movie in the "Horror" genre?
SELECT title, rating FROM movies WHERE genre = 'Horror' ORDER BY rating DESC LIMIT 1;

-- 17. List movies that have both a duration of more than 150 minutes and a budget of less than $10 million
SELECT title FROM movies WHERE duration > 150 AND budget < 10000000;

-- 18. What is the correlation between budget and IMDb rating?
SELECT CORR(budget, rating) AS correlation_budget_rating FROM movies;

-- 19. Find the average rating of movies by genre
SELECT genre, AVG(rating) AS avg_rating FROM movies GROUP BY genre;

-- 20. Which 5 movies have the lowest ratings but grossed the highest revenue?
SELECT title, rating, gross 
FROM movies 
ORDER BY rating ASC, gross DESC 
LIMIT 5;
