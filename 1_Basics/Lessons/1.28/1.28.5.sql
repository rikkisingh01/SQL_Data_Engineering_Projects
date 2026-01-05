WITH stable_job_markets AS (
    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2023h1

    INTERSECT

    SELECT
        job_title_short,
        job_country
    FROM year_mart.jobs_2024h1

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

EXCEPT

SELECT
    job_title_short,
    job_country
FROM job_markets_missing_salary_2025
ORDER BY
    job_title_short,
    job_country;