SELECT 
    m.movie_id,
    title,
    budget,
    revenue,
    unit,
    currency,
    CASE
        WHEN unit = 'Millions' THEN ROUND((revenue - budget), 2)
        WHEN unit = 'Billions' THEN ROUND((revenue - budget)*1000, 2)
        WHEN unit = 'Thousands' THEN ROUND((revenue - budget) * 0.001, 2)
    END AS profit_millions
FROM
    movies m
        LEFT JOIN
    financials f ON m.movie_id = f.movie_id
WHERE
    industry = 'Bollywood'
ORDER BY profit_millions DESC;