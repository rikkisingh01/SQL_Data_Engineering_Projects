MERGE INTO main.job_skill_priorities AS tgt
USING data_jobs.job_postings_fact AS src
ON tgt.job_id = src.job_id
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;