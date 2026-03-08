CREATE TABLE year_mart.jobs_2024h1 AS
SELECT
    j.job_id,
    j.job_title_short,
    j.job_location,
    j.job_country,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_work_from_home,
    j.job_posted_date,
    c.name AS company_name
FROM job_postings_fact AS j
LEFT JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE j.job_posted_date::DATE BETWEEN '2024-01-01' AND '2024-06-30';

SELECT job_posted_date::DATE as dt,
count(*) as record_count

FROM year_mart.jobs_2024h1

GROUP BY dt

ORDER BY dt ASC;