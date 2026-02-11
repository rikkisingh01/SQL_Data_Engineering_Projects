SELECT 
    job_id,
    job_location,
    salary_year_avg,
    DENSE_RANK() OVER(PARTITION BY job_location ORDER BY salary_year_avg DESC) AS salary_level
FROM 
    data_jobs.job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL;