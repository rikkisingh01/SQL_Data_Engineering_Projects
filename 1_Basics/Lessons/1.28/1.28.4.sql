SELECT 'jobs_2023_h2' AS table_name,
count(*) as record_count

FROM
(
SELECT *
FROM year_mart.jobs_2023

EXCEPT

SELECT *
FROM year_mart.jobs_2023h1
)

UNION

SELECT 'jobs_2023_h1' AS table_name, 
COUNT(*) AS record_count 

FROM year_mart.jobs_2023h1

UNION

SELECT 'jobs_2023_total' AS table_name,
COUNT(*) AS record_count

FROM year_mart.jobs_2023

ORDER BY table_name;


SELECT 'jobs_2023_h1' AS table_name, 
COUNT(*) AS record_count 
FROM year_mart.jobs_2023h1 
WHERE job_country = 'United States'
GROUP BY table_name

UNION ALL

SELECT 'jobs_2024_h1' AS table_name, 
COUNT(*) AS record_count                
FROM year_mart.jobs_2024h1 
WHERE job_country = 'United States'
GROUP BY table_name

UNION ALL

SELECT 'jobs_2025_h1' AS table_name, 
COUNT(*) AS record_count               
FROM year_mart.jobs_2025h1 
WHERE job_country = 'United States';