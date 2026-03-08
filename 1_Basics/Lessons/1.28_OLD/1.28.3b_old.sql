SELECT *
FROM year_mart.jobs_2023h1

EXCEPT

SELECT *
FROM year_mart.jobs_2023;

--397,080

SELECT *
FROM year_mart.jobs_2023h1

INTERSECT

SELECT *
FROM year_mart.jobs_2023;

--397,080

SELECT *
FROM year_mart.jobs_2023h1

INTERSECT ALL 

SELECT *
FROM year_mart.jobs_2023;

--

SELECT MIN(s1.job_posted_date::DATE), 
MAX(s1.job_posted_date)

FROM
(
SELECT *
FROM year_mart.jobs_2023

EXCEPT

SELECT *
FROM year_mart.jobs_2023h1) as s1;


SELECT *
FROM year_mart.jobs_2023

EXCEPT

SELECT *
FROM year_mart.jobs_2023h1;