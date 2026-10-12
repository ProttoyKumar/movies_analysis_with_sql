-- Find Hollywood movies
SELECT 
    *
FROM
    movies
WHERE
    industry = 'Hollywood';
    
-- Count Hollywood movies
SELECT 
    COUNT(*)
FROM
    movies
WHERE
    industry = 'Hollywood';

-- Find unique industries in my db
SELECT 
    distinct industry
FROM
    movies;

-- Find movies which have thor in title
SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%Thor%';
    
-- Find all movies which have america in title
SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%america%'; -- wild card search

-- Find movies in our db where studio is missing 
SELECT 
    *
FROM
    movies
WHERE
    studio = "";
    
-- Print all movie titles and release year for all Marvel Studios movies
SELECT 
    title, release_year
FROM
    movies
WHERE
    studio = 'Marvel Studios';

-- Print all movies that have Avenger in their name
SELECT 
    *
FROM
    movies
WHERE
    title Like 'Avengers%';

-- Print the year when the movie "The Godfather" was released
SELECT 
    release_year
FROM
    movies
WHERE
    title = 'The Godfather';
    
-- Print all distinct movie studios in the Bollywood industry
select distinct studio from movies where industry = 'Bollywood';

-- Numeric Query

-- Find movies which have imdb rating greater than or equal to 8
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating >= 8;
    
-- Find movies which have imdb rating between 6 & 8
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating BETWEEN 6 AND 8;
    
-- Find movies of year 2022, 2019, 2018
SELECT 
    *
FROM
    movies
WHERE
    release_year IN (2019 , 2018, 2022); -- or conditions

select * from movies where studio = 'Marvel Studios' or studio = 'Zee Studios';

-- Alternative: IN operator
select * from movies where studio IN ('Marvel Studios', 'Zee Studios');

-- Find movies which have valid imdb rating
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating IS NOT NULL;

-- Order by
SELECT 
    *
FROM
    movies
WHERE
    industry = 'Bollywood'
ORDER BY imdb_rating DESC;

-- Print highest rated movies on imdb 
SELECT 
    *
FROM
    movies
ORDER BY imdb_rating DESC
LIMIT 5;

-- Skip the first 2 rows
-- OFFSET is used to skip a specified number of rows before returning the results of a query
-- OFFSET is commonly used with LIMIT

SELECT 
    *
FROM
    movies
ORDER BY imdb_rating DESC
LIMIT 5 OFFSET 1;

-- Print all movies in the order of their release year (latest first)
SELECT 
    *
FROM
    movies
ORDER BY release_year DESC;

-- All movies released in the year 2022
SELECT 
    *
FROM
    movies
WHERE
    release_year = 2022;
    
-- All movies released after 2020
SELECT 
    *
FROM
    movies
WHERE
    release_year > 2020;
    
-- All movies after the year 2020 that have more than 8 rating
SELECT 
    *
FROM
    movies
WHERE
    release_year>2020 AND imdb_rating>8;
    
-- Select all movies that are by Marvel studios and Hombale Films
select * from movies where studio in ('Marvel studios', 'Hombale Films');
-- Select all THOR movies by their release year
select * from movies where title like 'Thor%' order by release_year;
-- Select all movies that are not from Marvel Studios
select * from movies where studio!='Marvel Studios';