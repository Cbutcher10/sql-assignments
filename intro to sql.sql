-- How many counties are represented? How many companies?
SELECT COUNT(DISTINCT county) AS county_count,
COUNT(DISTINCT company) AS company_count
FROM ecd;

-- How many companies did not get ANY Economic Development grants (ed) for any of their projects?
SELECT COUNT(DISTINCT company) AS no_grant_count
FROM ecd
WHERE ed IS NULL;

-- What is the total capital_investment, in millions, when there was a grant received from the fjtap? 
-- 	Call the column fjtap_cap_invest_mil.
SELECT SUM(capital_investment) / 1000000.0 AS fjtap_cap_invest_mil
FROM ecd
WHERE fjtap::numeric > 0;

-- What is the average number of new jobs for each county_tier?
SELECT county_tier,AVG(new_jobs) AS avg_new_jobs
FROM ecd
GROUP BY county_tier
ORDER BY county_tier;

-- How many companies are LLCs? Call this value llc_companies
SELECT COUNT(DISTINCT company) AS llc_companies
FROM ecd
WHERE company ILIKE '%llc%';																																	