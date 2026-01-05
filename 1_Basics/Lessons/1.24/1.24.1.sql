SELECT
    jpf.job_id,
    jpf.job_title,
    cd.name AS company_name,
    jpf.salary_year_avg,
    CASE 
        WHEN jpf.salary_year_avg >= 100000 THEN 'High salary'
        WHEN jpf.salary_year_avg >= 60000 THEN 'Standard salary'
        WHEN jpf.salary_year_avg < 60000 THEN 'Low salary'
    END AS salary_category
FROM 
    job_postings_fact AS jpf
    INNER JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id
WHERE
    jpf.salary_year_avg IS NOT NULL
    AND jpf.job_title_short = 'Data Engineer'
ORDER BY
    jpf.salary_year_avg DESC;