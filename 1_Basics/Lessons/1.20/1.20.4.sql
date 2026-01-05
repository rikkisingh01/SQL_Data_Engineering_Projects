SELECT jpf.job_posted_date,
jpf.company_id,
jpf.job_title_short,
jpf.job_posted_date::DATE as dt,
epoch(jpf.job_posted_date::DATE) as date_int,
jpf.company_id::STRING || '-' || epoch(jpf.job_posted_date::DATE) as compound_key

FROM job_postings_fact as jpf

LIMIT 10;

SELECT 
    jpf.job_posted_date,
    jpf.company_id,
    jpf.job_title_short,
    jpf.job_posted_date::DATE as dt,
    jpf.company_id::STRING || '-' || (jpf.job_posted_date::DATE)::STRING as compound_key

FROM job_postings_fact as jpf

LIMIT 10;

SELECT 
    jpf.job_posted_date,
    jpf.company_id,
    jpf.job_title_short,
    jpf.job_posted_date::DATE as dt,
    jpf.company_id::STRING || '-' || jpf.job_posted_date::DATE::STRING as compound_key

FROM job_postings_fact as jpf

LIMIT 10;