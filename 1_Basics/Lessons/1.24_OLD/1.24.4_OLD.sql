SELECT 
    jpf.job_id,
    jpf.job_title,
    jpf.salary_year_avg,
    CASE
        WHEN jpf.job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN jpf.job_title ILIKE '%Manager%' OR jpf.job_title ILIKE '%Lead%' THEN 'Lead/Manager'
        WHEN jpf.job_title ILIKE '%Junior%' OR jpf.job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN jpf.job_work_from_home = TRUE THEN 'Yes'
        ELSE 'No' 
    END AS remote_option
FROM 
    job_postings_fact AS jpf
WHERE 
    jpf.salary_year_avg IS NOT NULL
ORDER BY 
    jpf.job_id;