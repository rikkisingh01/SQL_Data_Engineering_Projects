SELECT
  job_id,
  job_title_short,
  job_location,
  job_posted_date, 
  EXTRACT(YEAR FROM job_posted_date) as job_posted_year,
  EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
  EXTRACT(DAY FROM job_posted_date) AS job_posted_day,
  EXTRACT(QUARTER FROM job_posted_date) AS job_posted_quarter
FROM
  job_postings_fact

WHERE job_posted_date::DATE BETWEEN '2023-01-01' and '2024-12-31';




SELECT
  EXTRACT(YEAR FROM job_posted_date) || '-' || EXTRACT(QUARTER FROM job_posted_date) as year_quarter,
  COUNT(job_id) as job_posts

FROM
  job_postings_fact

WHERE job_title_short = 'Data Engineer' 
--job_country = 'United States'

GROUP BY year_quarter

ORDER BY year_quarter ASC;