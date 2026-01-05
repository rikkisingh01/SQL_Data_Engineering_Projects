
SELECT table_name, 
constraint_name, 
count(constraint_name) as constraint_name_count
FROM information_schema.key_column_usage
WHERE table_catalog = 'data_jobs'
GROUP BY table_name, constraint_name
HAVING count(constraint_name) > 1;



