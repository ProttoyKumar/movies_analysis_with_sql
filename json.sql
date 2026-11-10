SELECT 
    name,
    JSON_EXTRACT(properties, '$.gluten_free') AS gluten_free
FROM
    items
WHERE
    JSON_EXTRACT(properties, '$.gluten_free') IS NOT NULL;

# count total gluten free items
SELECT COUNT(*) AS total_gluten_free
FROM items
WHERE properties->>'$.gluten_free' = 1;

# count blue TShirts
SELECT COUNT(*) AS blue_tshirt
FROM items
WHERE properties->>'$.color' = 'blue';
    
