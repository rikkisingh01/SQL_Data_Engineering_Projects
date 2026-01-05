SELECT jpf.job_posted_date::DATE as job_posted_date,
job_title_short,
COUNT(job_id) as job_postings

FROM job_postings_fact as jpf

WHERE jpf.job_posted_date::DATE = '2024-12-31'

GROUP BY jpf.job_posted_date::DATE, jpf.job_title_short

ORDER BY job_postings DESC;

SELECT
  job_posted_date::TIME AS job_posted_time,
  COUNT(job_id) AS job_postings
FROM job_postings_fact
WHERE
  job_posted_date::TIME > '12:00:00'
GROUP BY
  job_posted_time
ORDER BY
  job_posted_time ASC;


SELECT
  job_posted_date::TIME AS job_posted_time,
  COUNT(job_id) AS job_postings
FROM job_postings_fact
WHERE
  job_posted_date::TIME > '12:00:00'
GROUP BY
  job_posted_time
ORDER BY
  job_posted_time ASC;


SELECT DISTINCT jpf.job_no_degree_mention
FROM job_postings_fact as jpf
--WHERE jpf.job_schedule_type LIKE '%Full-time%'
;


SELECT
  jpf.job_title_short,
  jpf.job_no_degree_mention::INT as job_no_degree_mention,
  COUNT(job_id) AS job_postings
FROM job_postings_fact as jpf
WHERE
  job_posted_date::DATE BETWEEN '2024-12-01' AND '2024-12-31'
GROUP BY
  jpf.job_title_short, jpf.job_no_degree_mention
ORDER BY job_title_short, jpf.job_no_degree_mention;


SELECT
  jpf.job_title_short,
  jpf.job_no_degree_mention,
  COUNT(job_id) AS job_postings
FROM job_postings_fact as jpf
WHERE
  job_posted_date::DATE = '2024-12-31'
GROUP BY
  jpf.job_title_short, jpf.job_no_degree_mention
ORDER BY job_title_short, jpf.job_no_degree_mention;