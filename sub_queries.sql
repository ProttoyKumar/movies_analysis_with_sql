# return single value
# movies with max imdb_rating
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating = (SELECT 
            MAX(imdb_rating)
        FROM
            movies);

# sub-queries that returned list of values
# movies with maximum and minimum rating
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating IN ((SELECT 
            MIN(imdb_rating)
        FROM
            movies) , (SELECT 
                MAX(imdb_rating)
            FROM
                movies));
# select actors whose age >70 and <85
SELECT 
    *, YEAR(CURRENT_DATE()) - birth_year AS age
FROM
    actors
Having age > 70 and age < 85;

# using sub-query
SELECT 
    *
FROM
    (SELECT 
        *, YEAR(CURRENT_DATE()) - birth_year AS age
    FROM
        actors) AS actors_age_table
WHERE
    age > 70 AND age < 85;

# select actors who acted in any of these movies 101, 110, 121
SELECT 
    name
FROM
    actors
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            movie_actor
        WHERE
            movie_id IN (101 , 110, 121));
            
SELECT 
    name
FROM
    actors
WHERE
    actor_id = ANY (SELECT 
            actor_id
        FROM
            movie_actor
        WHERE
            movie_id IN (101 , 110, 121));
            
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating > (SELECT 
            MIN(imdb_rating)
        FROM
            movies
        WHERE
            studio = 'Marvel Studios')
        OR imdb_rating IS NULL;

SELECT 
    actor_id, name,
    (select count(*) from movie_actor where actor_id=actors.actor_id) as movies_count
FROM
    actors
Order by movies_count desc;

# EXERCISE 1
# Select all the movies with minimum and maximum release_year. 

SELECT 
    *
FROM
    movies
WHERE
    release_year IN ((SELECT 
            MIN(release_year)
        FROM
            movies) , (SELECT 
                MAX(release_year)
            FROM
                movies));

# EXERCISE 2
#  Select all the rows from the movies table whose imdb_rating is higher than the average rating


SELECT 
    *
FROM
    movies
WHERE
    imdb_rating > (SELECT 
            AVG(imdb_rating)
        FROM
            movies);