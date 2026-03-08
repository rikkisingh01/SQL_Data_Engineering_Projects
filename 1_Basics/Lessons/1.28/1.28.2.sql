-- Set B: Non-Remote Jobs (onsite/hybrid + unknown)
CREATE TABLE work_mode_mart.not_remote_jobs AS
SELECT
  job_title,
  company_id,
  job_location
FROM data_jobs.job_postings_fact
WHERE job_work_from_home <> TRUE OR job_work_from_home IS NULL;

SELECT COUNT(*) AS remote_rows
FROM work_mode_mart.not_remote_jobs;