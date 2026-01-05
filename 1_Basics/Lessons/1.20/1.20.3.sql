SELECT jpf.job_title_short,
avg(jpf.salary_hour_avg * 52 * 40) as salary_hour_annual_double,
avg(jpf.salary_hour_avg * 52 * 40)::DECIMAL(10,2) as salary_hour_annual_decimal,

FROM job_postings_fact as jpf

WHERE jpf.job_country = 'United States'
AND jpf.salary_hour_avg IS NOT NULL

GROUP BY jpf.job_title_short

ORDER BY salary_hour_annual_double DESC;

--updated

SELECT jpf.job_title_short,
avg(jpf.salary_hour_avg * 52 * 40)::DECIMAL(10,2) salary_hour_annual,
avg(jpf.salary_hour_avg * 52 * 40)::INT as salary_hour_annual_zero_decimals

FROM job_postings_fact as jpf

WHERE jpf.job_country = 'United States'
AND jpf.salary_hour_avg IS NOT NULL

GROUP BY jpf.job_title_short

ORDER BY salary_hour_annual DESC;