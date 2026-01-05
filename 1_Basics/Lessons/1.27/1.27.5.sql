SELECT
  DATE_TRUNC('quarter', job_posted_date) AS job_quarter,
  COUNT(job_id) AS job_count
FROM
  job_postings_fact
WHERE
  --EXTRACT(YEAR FROM job_posted_date) BETWEEN 2022 and 2024
  DATE_TRUNC('year', job_posted_date) BETWEEN '2022-01-01' and '2024-12-31'
GROUP BY
  job_quarter
ORDER BY
  job_quarter;