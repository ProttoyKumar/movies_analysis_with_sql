SELECT 
    movies.movie_id,
    movies.title,
    financials.budget,
    financials.revenue,
    financials.unit,
    financials.currency
FROM
    movies
        INNER JOIN
    financials ON movies.movie_id = financials.movie_id;

SELECT 
    movies.movie_id,
    title,
    budget,
    revenue,
    unit,
    currency
FROM
    movies
        Left JOIN
    financials ON movies.movie_id=financials.movie_id;

-- union
SELECT 
    movies.movie_id, title, budget, revenue, unit, currency
FROM
    movies
        LEFT JOIN
    financials ON movies.movie_id = financials.movie_id 
UNION SELECT 
    financials.movie_id, title, budget, revenue, unit, currency
FROM
    movies
        RIGHT JOIN
    financials ON movies.movie_id = financials.movie_id;
    
-- Print all the movies with their language names
SELECT 
    movie_id, title, name
FROM
    movies
        LEFT JOIN
    languages ON movies.language_id = languages.language_id;

-- Print all Telugu movie names
SELECT 
    movie_id, title, name
FROM
    movies
        LEFT JOIN
    languages ON movies.language_id = languages.language_id
WHERE
    name = 'Telgu';

-- Show the language and number of movies released in that language
SELECT 
    name, COUNT(movie_id) as movies_count
FROM
    movies
Left Join languages on movies.language_id = languages.language_id
GROUP BY name;