SELECT 
    job_id,
    COALESCE (
        NULLIF(salary_year_avg, 0), 
        NULLIF(salary_hour_avg, 0) * 2080, 
        50000
    ) AS final_salary
FROM 
    job_postings_fact;