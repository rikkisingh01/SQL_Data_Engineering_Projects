INSERT INTO staging.priority_skills (skill_id, skill_name, priority_lvl)
VALUES (74, 'aws', 2);

MERGE INTO main.job_skill_priorities AS tgt
USING staging.priority_skills AS src
ON tgt.skill_id = src.skill_id
WHEN MATCHED THEN
    UPDATE SET priority_lvl = src.priority_lvl
WHEN NOT MATCHED THEN
    INSERT (skill_id, priority_lvl, status)
    VALUES (src.skill_id, src.priority_lvl, 'NEW_SKILL');