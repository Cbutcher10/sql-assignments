-- Using the population table, write a query that selects the county, 2017 population, and uses a case statement to characterize the 2017 population (call this pop_category) according to the following business rule:
SELECT county,population AS population_2017,
CASE
WHEN population >= 500000 THEN 'High Population'
WHEN population >= 100000 AND population < 500000 THEN 'Medium Population'
WHEN population < 100000 THEN 'Low Population'
END AS pop_category
FROM population
WHERE year = 2017;

-- Write a query that selects the company, landed date, number of new jobs, and a case statement to classify observations (rows) in the table where the project type is New Startup according to the following business rule:
SELECT company,landed,new_jobs,
CASE
WHEN new_jobs < 50 THEN 'Small Startup'
WHEN new_jobs BETWEEN 50 AND 100 THEN 'Midsize Startup'
WHEN new_jobs > 100 THEN 'Large Startup'
END AS startup_size
FROM ecd
WHERE project_type = 'New Startup';

-- Write a query using the population table to find the total population for 2010 and 2017, labeled as Total_Pop_2010 and Total_Pop_2017.
SELECT SUM(CASE WHEN year = 2010 THEN population END) AS Total_Pop_2010,
SUM(CASE WHEN year = 2017 THEN population END) AS Total_Pop_2017
FROM population;