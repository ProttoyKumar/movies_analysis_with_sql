UPDATE movies 
SET 
    release_year = 2030
WHERE
    movie_id = 141;

UPDATE movies 
SET 
    studio = 'Warner Bros. Pictures'
WHERE
    movie_id = 141;

# undate multiple records

UPDATE movies 
SET 
    studio = 'Warner Bros. Pictures'
WHERE
    movie_id in (112, 141, 142, 143);

SELECT 
    movie_id
FROM
    movies
WHERE
    title LIKE '%Inception%';
    
DELETE FROM movies 
WHERE
    movie_id = 141;
    
Select * from movies;
    