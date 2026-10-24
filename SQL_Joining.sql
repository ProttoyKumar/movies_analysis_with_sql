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

SELECT 
    m.movie_id,
    title,
    GROUP_CONCAT(name
        SEPARATOR ', ') AS actors
FROM
    movies m
        JOIN
    movie_actor ma ON ma.movie_id = m.movie_id
        JOIN
    actors a ON a.actor_id = ma.actor_id
GROUP BY m.movie_id;

SELECT 
    a.actor_id,
    a.name,
    GROUP_CONCAT(m.title
        SEPARATOR ', ') AS movie,
    COUNT(m.title) AS movie_count
FROM
    actors AS a
        JOIN
    movie_actor AS ma ON ma.actor_id = a.actor_id
        JOIN
    movies AS m ON m.movie_id = ma.movie_id
GROUP BY a.actor_id
ORDER BY movie_count DESC;

SELECT 
    title,
    CASE
        WHEN unit = 'Thousands' THEN revenue * 0.001
        WHEN unit = 'Billions' THEN revenue * 1000
        ELSE revenue
    END AS revenue_millions,
    currency
FROM
    financials f
        JOIN
    movies m ON m.movie_id = f.movie_id
WHERE
    industry = 'Bollywood'
ORDER BY revenue_millions DESC;
    
