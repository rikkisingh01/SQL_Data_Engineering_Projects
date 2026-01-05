SELECT 'jobs_2023_h1' AS table_name, 
COUNT(*) AS record_count 

FROM year_mart.jobs_2023h1 

WHERE job_country = 'United States'

UNION ALL

SELECT 'jobs_2024_h1' AS table_name, 
COUNT(*) AS record_count              

FROM year_mart.jobs_2024h1 

WHERE job_country = 'United States'

UNION ALL

SELECT 'jobs_2025_h1' AS table_name, 
COUNT(*) as record_count                

FROM year_mart.jobs_2025h1 

WHERE job_country = 'United States';