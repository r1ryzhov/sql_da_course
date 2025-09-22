select job_id,
    company_id,
    job_title,
    salary_year_avg
from
    job_postings_fact
where
    job_title_short = 'Data Analyst'
    and job_location = 'Anywhere'
    and salary_year_avg is not null
order by salary_year_avg desc
limit 15;