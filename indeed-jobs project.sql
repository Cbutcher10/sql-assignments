-- How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;

-- Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
ORDER BY title
LIMIT 10;

SELECT *
FROM data_analyst_jobs
ORDER BY Title
LIMIT 1 OFFSET 9;

-- How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(*) AS tn_postings
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(*) AS tn_or_ky_postings
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY');

-- How many postings in Tennessee have a star rating above 4?
SELECT COUNT(*) AS tn_high_rating_postings
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;

-- How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*) AS reviews_500_to_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- Show the average star rating for companies in each state. 
-- The output should show the state as state 
-- and the average rating for the state as avg_rating. Which state shows the highest average rating?
SELECT location AS state,
AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title) AS distinct_job_titles
FROM data_analyst_jobs;

-- How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title) AS unique_job_titles_ca
FROM data_analyst_jobs
WHERE location = 'CA';

-- Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
-- How many companies are there with more that 5000 reviews across all locations?
SELECT company,
SUM(review_count) AS total_reviews,
AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY total_reviews DESC;

SELECT COUNT(*) AS num_companies_over_5000
FROM (
SELECT
company
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
) AS sub;

-- Add the code to order the query in #9 from highest to lowest average star rating. 
-- Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company,
SUM(review_count) AS total_reviews,
AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY avg_star_rating DESC;

-- Find all the job titles that contain the word ‘Analyst’. 
-- How many different job titles are there?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'
ORDER BY title;

SELECT COUNT(DISTINCT title) AS analyst_title_count
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

-- How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
-- What word do these positions have in common?
SELECT COUNT(DISTINCT title) AS non_analyst_titles
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%'
ORDER BY title;