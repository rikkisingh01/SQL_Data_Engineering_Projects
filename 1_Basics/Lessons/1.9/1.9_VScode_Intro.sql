SELECT 'data nerd' as job_title;

CREATE TABLE jobs (
    id INTEGER,
    job VARCHAR
);

INSERT INTO jobs VALUES
    (1, 'Data Analyst'),
    (2, 'Data Scientist'),
    (3, 'Data Engineer');

SELECT * FROM jobs;