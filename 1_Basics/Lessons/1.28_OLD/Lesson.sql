CREATE SCHEMA year_mart;

CREATE TABLE year_mart.jobs_2023 AS
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
WHERE EXTRACT(YEAR FROM j.job_posted_date) = 2023;

CREATE TABLE year_mart.jobs_2024 AS
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
WHERE EXTRACT(YEAR FROM j.job_posted_date) = 2024;

CREATE TABLE year_mart.jobs_2025h1 AS
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
WHERE EXTRACT(YEAR FROM j.job_posted_date) = 2025;

SELECT 'jobs_2023'     AS table_name, COUNT(*) AS record_count FROM year_mart.jobs_2023
UNION ALL
SELECT 'jobs_2024'     AS table_name, COUNT(*)                FROM year_mart.jobs_2024
UNION ALL
SELECT 'jobs_2025_h1'  AS table_name, COUNT(*)                FROM year_mart.jobs_2025h1;

SELECT COUNT(*) FROM job_postings_fact;

SELECT
    job_title_short,
    job_country
FROM year_mart.jobs_2023

EXCEPT

SELECT
    job_title_short,
    job_country
FROM year_mart.jobs_2025h1
ORDER BY job_title_short, job_country;



SELECT
    job_title_short,
    job_country
FROM year_mart.jobs_2023

INTERSECT

SELECT
    job_title_short,
    job_country
FROM year_mart.jobs_2024

INTERSECT

SELECT
    job_title_short,
    job_country
FROM year_mart.jobs_2025h1
ORDER BY job_title_short, job_country;





WITH stable_job_markets AS (
    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2023

    INTERSECT

    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2024

    INTERSECT

    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2025h1
),
job_markets_missing_salary_2025 AS (
    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2025h1
    WHERE salary_year_avg IS NULL
)
SELECT
    job_title_short,
    job_country
FROM stable_job_markets

INTERSECT

SELECT
    job_title_short,
    job_country
FROM job_markets_missing_salary_2025
ORDER BY
    job_title_short,
    job_country;




WITH stable_job_markets AS (
    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2023

    INTERSECT

    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2024

    INTERSECT

    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2025h1
),
job_markets_missing_salary_2025 AS (
    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2025h1
    WHERE salary_year_avg IS NULL
)
SELECT
    job_title_short,
    job_country
FROM stable_job_markets

EXCEPT  --add except to find the difference

SELECT
    job_title_short,
    job_country
FROM job_markets_missing_salary_2025
ORDER BY
    job_title_short,
    job_country;