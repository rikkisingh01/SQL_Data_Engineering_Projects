
SELECT abbrev,
COUNT(name) as record_count

FROM pg_timezone_names()

GROUP BY abbrev

ORDER BY record_count DESC;