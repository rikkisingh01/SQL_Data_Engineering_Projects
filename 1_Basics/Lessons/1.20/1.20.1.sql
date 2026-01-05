SELECT 
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'job_postings_fact';



SELECT 
    jpf.job_posted_date::DATE as dt,
    COUNT(job_id) as job_postings
FROM job_postings_fact as jpf
WHERE 
    jpf.job_posted_date::DATE = '2024-12-31'
GROUP BY 
    dt;