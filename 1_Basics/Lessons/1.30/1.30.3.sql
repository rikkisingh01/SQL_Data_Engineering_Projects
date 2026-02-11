SELECT 
    job_id,
    skill_id,
    COUNT(job_id) OVER(PARTITION BY skill_id) AS global_skill_count
FROM 
    data_jobs.skills_job_dim;