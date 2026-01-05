SELECT
    jpf.job_title_short,
    jpf.job_work_from_home,
    jpf.salary_year_avg,
    jpf.job_work_from_home::INT * ((jpf.salary_year_avg/2080)*260) AS annual_commute_salary_savings,
    jpf.salary_year_avg + (jpf.job_work_from_home::INT * ((jpf.salary_year_avg/2080)*260)) AS adjusted_salary
FROM
    job_postings_fact as jpf
WHERE
    salary_year_avg IS NOT NULL;


SELECT
    jpf.job_title_short,
    jpf.job_work_from_home,
    AVG(jpf.salary_year_avg),
    AVG(jpf.job_work_from_home::INT * ((jpf.salary_year_avg/2080)*260)) AS annual_commute_cost_savings,
    AVG(jpf.salary_year_avg) + AVG(jpf.job_work_from_home::INT * ((jpf.salary_year_avg/2080)*260)) AS adjusted_salary
FROM
    job_postings_fact as jpf
WHERE
    jpf.salary_year_avg IS NOT NULL
    AND jpf.job_country = 'United States'
    AND jpf.job_title_short ILIKE '%Data%'
GROUP BY jpf.job_work_from_home, jpf.job_title_short
ORDER BY jpf.job_title_short DESC, jpf.job_work_from_home ASC;


--updated

SELECT
    jpf.job_title_short,
    jpf.job_work_from_home,
    AVG(jpf.salary_year_avg)::INT as annual_salary_avg,
    AVG(jpf.job_work_from_home::INT * ((jpf.salary_year_avg/2080)*260))::INT AS annual_commute_cost_savings,
    AVG(jpf.salary_year_avg) + AVG(jpf.job_work_from_home::INT * ((jpf.salary_year_avg/2080)*260))::INT AS adjusted_annual_salary_avg
FROM
    job_postings_fact as jpf
WHERE
    jpf.job_country = 'United States'
    AND jpf.job_title_short LIKE '%Data%'
GROUP BY jpf.job_title_short, jpf.job_work_from_home
ORDER BY jpf.job_title_short DESC, jpf.job_work_from_home ASC;