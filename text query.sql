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