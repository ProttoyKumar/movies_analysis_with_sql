-- Find maximum rating of Bollywood industry
select max(imdb_rating) as max_rating from movies where industry='Bollywood';
-- Find minimum rating of Bollywood industry
select min(imdb_rating) as min_rating from movies where industry='Bollywood';
-- Find average rating of marvel movies
select round(avg(imdb_rating), 1) as avg_rating from movies where studio='Marvel Studios';

SELECT 
    ROUND(AVG(imdb_rating), 1) AS avg_rating,
    MIN(imdb_rating) AS min_rating,
    MAX(imdb_rating) AS max_rating
FROM
    movies
WHERE
    studio = 'Marvel Studios';
    
-- Group by industry
select industry, count(*) as no_of_movies from movies group by industry;
select industry, count(*) as no_of_movies from movies group by industry order by no_of_movies desc;

SELECT 
    industry,
    COUNT(*) AS no_of_movies,
    ROUND(AVG(imdb_rating), 1) AS rating
FROM
    movies
GROUP BY industry
ORDER BY no_of_movies DESC;

-- How many movies were released between 2015 and 2022?
SELECT 
    COUNT(movie_id)
FROM
    movies
WHERE
    release_year BETWEEN 2015 AND 2022;
    
-- Print the max and min movie release year
SELECT 
    MAX(release_year) AS max_release_year,
    MIN(release_year) AS min_release_year
FROM
    movies;

-- Print each year along with the number of movies released in that year, starting from the most recent year
SELECT 
    release_year, COUNT(movie_id) AS released_movies
FROM
    movies
GROUP BY release_year
ORDER BY release_year DESC;

-- Print each year along with the number of movies released in that year, having more than 2 movies
SELECT 
    release_year, COUNT(movie_id) AS no_of_movies
FROM
    movies
GROUP BY release_year
HAVING no_of_movies > 2;

-- How to find current date in sql??
SELECT CURDATE();
-- How to find current year in sql??
SELECT YEAR(CURDATE());

-- Calculated Column
SELECT 
    actor_id, YEAR(CURDATE()) - birth_year AS age
FROM
    actors;
    
# select month('2026-10-13')
# select day('2026-10-13')

SELECT 
    movie_id,
    CASE
        WHEN currency = 'INR' THEN revenue
        ELSE ROUND(revenue * 77.0, 2)
    END AS revenue_inr
FROM
    financials;

SELECT 
    movie_id,
    CASE
        WHEN unit = 'Billions' THEN revenue * 1000
        WHEN unit = 'Thousands' THEN revenue * 0.001
        ELSE revenue
    END AS revenue_millions
FROM
    financials;

-- Print profit % for all the movies
SELECT 
    *, (revenue - budget) * 100 / budget AS profit_pct
FROM
    financials;