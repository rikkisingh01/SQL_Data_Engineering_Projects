WITH company_spending AS (
    SELECT 
        company_id,
        job_id,
        salary_year_avg,
        SUM(salary_year_avg) OVER(PARTITION BY company_id) AS total_company_spend
    FROM 
        data_jobs.job_postings_fact
    WHERE 
        salary_year_avg IS NOT NULL
)
SELECT 
    *,
    (salary_year_avg / total_company_spend) * 100 AS percent_of_total_spend
FROM 
    company_spending;