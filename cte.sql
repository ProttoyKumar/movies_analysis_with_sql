with actors_age as (
SELECT 
        *, YEAR(CURRENT_DATE()) - birth_year AS age
    FROM
        actors)
select name, age from actors_age
where age>70 and age<85;




# movies that produced 500 % or more profit
with profit_table as (
SELECT 
    *, ROUND((revenue - budget) * 100 / budget, 2) as profit_pct
FROM
    financials
having profit_pct >= 500),

# movies whose ratings was less than avg rating for all the movies
rating_table as (
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating < (SELECT 
            AVG(imdb_rating)
        FROM
            movies)
)

SELECT 
    a.movie_id, title, imdb_rating, profit_pct
FROM
    profit_table a
        JOIN
    rating_table b ON a.movie_id = b.movie_id;