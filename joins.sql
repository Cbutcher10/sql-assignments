-- How many rows are in the athletes table? How many distinct athlete ids?
SELECT COUNT(*) AS total_rows
FROM athletes;

SELECT COUNT(DISTINCT id) AS distinct_athlete_ids
FROM athletes;

-- Which years are represented in the summer_games, winter_games, and country_stats tables?
SELECT DISTINCT year
FROM summer_games
ORDER BY year;

SELECT DISTINCT year
FROM winter_games
ORDER BY year;

SELECT DISTINCT year
FROM country_stats
ORDER BY year;

-- How many distinct countries are represented in the countries and country_stats table?
SELECT COUNT(DISTINCT id) AS distinct_countries
FROM countries;

SELECT COUNT(DISTINCT country_id) AS distinct_countries_in_stats
FROM country_stats;

-- How many distinct events are in the winter_games and summer_games table?
SELECT COUNT(DISTINCT event) AS distinct_summer_events
FROM summer_games;

SELECT COUNT(DISTINCT event) AS distinct_winter_events
FROM winter_games;

-- Count the number of athletes who participated in the summer games for each country. Your output should have country name and number of athletes in their own columns. Did any country have no athletes?
SELECT c.country,
COUNT(DISTINCT sg.athlete_id) AS athlete_count
FROM countries AS c
LEFT JOIN summer_games AS sg
ON c.id = sg.country_id
GROUP BY c.country
ORDER BY athlete_count DESC;

SELECT c.country
FROM countries AS c
LEFT JOIN summer_games AS sg
ON c.id = sg.country_id
GROUP BY c.country
HAVING COUNT(DISTINCT sg.athlete_id) = 0;

-- Write a query to list countries by total bronze medals, with the highest totals at the top and nulls at the bottom.
-- Adjust the query to only return the country with the most bronze medals

-- Calculate the average population in the country_stats table for countries in the winter_games. This will require 2 joins.
-- First query gives you country names and the average population
-- Second query returns only countries that participated in the winter_games
SELECT c.country,
AVG(cs.pop_in_millions::numeric) AS avg_population
FROM winter_games AS wg
JOIN country_stats AS cs
ON wg.country_id = cs.country_id      
JOIN countries AS c
ON cs.country_id = c.id               
GROUP BY c.country
ORDER BY avg_population DESC;

-- Identify countries where the population decreased from 2000 to 2006.
select country, a.year, a.pop_in_millions, by.year, b.pop_in_millions
From country_stats AS a
INNER JOIN country_stats AS b
ON a.country_id = b.country_id
INNER JOIN countries
ON a.country_id = countries.id
WHERE a.year = '2000-01-01' AND b.year = '2006-01-01'
AND a.pop_in_millions::NUMERIC > b.pop_in_millions::numeric;