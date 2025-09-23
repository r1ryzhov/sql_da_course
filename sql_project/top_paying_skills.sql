with top_paying_jobs as(
    select job_id,
        name as company_name,
        job_title,
        salary_year_avg
    from
        job_postings_fact
    left join company_dim using(company_id)
    where
        job_title_short = 'Data Analyst'
        and job_location = 'Anywhere'
        and salary_year_avg is not null
    order by salary_year_avg desc
    limit 15
)

select top_paying_jobs.*,
    skills
from top_paying_jobs
INNER JOIN skills_job_dim using(job_id)
inner join skills_dim using(skill_id)
order by salary_year_avg desc;

/*
Какие навыки чаще всего упоминаются в самых высокооплачиваемых вакансиях?

В самых высокооплачиваемых вакансиях чаще всего упоминаются следующие навыки:
    Python: 16 упоминаний
    SQL: 12 упоминаний
    Azure: 10 упоминаний
    AWS: 9 упоминаний
    Tableau: 8 упоминаний
Эти данные показывают, что навыки в области программирования (Python, SQL) и работы с облачными платформами (Azure, AWS) являются наиболее востребованными среди высокооплачиваемых должностей.
*/