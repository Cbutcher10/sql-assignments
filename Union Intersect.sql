-- Write a query to list all athlete names who participated in the Summer or Winter Olympics. Ensure no duplicates appear in the final table using a set theory clause.\
SELECT DISTINCT a.name
FROM athletes a
JOIN summer_games sg
ON a.id = sg.athlete_id

UNION

SELECT DISTINCT a.name
FROM athletes a
JOIN winter_games wg
ON a.id = wg.athlete_id
ORDER BY name;

-- Write a query to retrieve country_id and country_name for countries in the Summer Olympics.
-- Add a JOIN to include the country’s 2016 population and exclude the country_id from the SELECT statement.
-- Repeat the process for the Winter Olympics.
-- Use a set theory clause to combine the results.
SELECT DISTINCT c.country,cs.pop_in_millions
FROM countries c
JOIN summer_games sg
ON c.id = sg.country_id
JOIN country_stats cs
ON c.id = cs.country_id
WHERE SUBSTRING(cs.year, 1, 4)::int = 2016

INTERSECT

SELECT DISTINCT c.country,cs.pop_in_millions
FROM countries c
JOIN winter_games wg
ON c.id = wg.country_id
JOIN country_stats cs
ON c.id = cs.country_id
WHERE SUBSTRING(cs.year, 1, 4)::int = 2016
ORDER BY country;

-- Identify Countries Exclusive to the Summer Olympics
-- Return the country_name and region for countries present in the countries table but not in the winter_games table.
SELECT country,region
FROM countries

EXCEPT

SELECT c.country,c.region
FROM countries c
JOIN winter_games wg
ON c.id = wg.country_id
ORDER BY country;