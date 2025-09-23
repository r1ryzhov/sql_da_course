WITH top_paying_jobs AS (
    SELECT 
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim 
        USING (company_id)
    WHERE 
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 15
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    USING (job_id)
INNER JOIN skills_dim 
    USING (skill_id)
ORDER BY salary_year_avg DESC;

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