SELECT 
    jpf.job_id,
    jpf.job_title,
    sd.skills,
    jpf.job_location
FROM 
    job_postings_fact AS jpf
    LEFT JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    LEFT JOIN skills_dim AS sd
        ON sjd.skill_id = sd.skill_id
WHERE 
    sjd.skill_id IS NULL
ORDER BY 
    jpf.job_id DESC;