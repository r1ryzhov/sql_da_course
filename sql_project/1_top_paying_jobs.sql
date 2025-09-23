SELECT 
    job_id,
    company_id,
    job_title,
    ROUND(salary_year_avg, 0) AS salary_year_avg
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 15;