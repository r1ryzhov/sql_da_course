SELECT 
    skills AS skill,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary_per_skill,
    COUNT(skills) AS quantity_of_vacancies
FROM job_postings_fact
INNER JOIN skills_job_dim 
    USING (job_id)
INNER JOIN skills_dim 
    USING (skill_id)
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary_per_skill DESC
LIMIT 20;

/*
Навыки с самой высокой средней зарплатой

Навыки svn и solidity имеют самые высокие зарплаты, но при этом у них всего по одной вакансии, что может указывать на узкоспециализированные или нишевые должности.
С другой стороны, такие навыки, как Kafka, Pytorch и Perl, имеют более низкую среднюю зарплату по сравнению с лидерами списка, но при этом обладают значительно более высоким спросом.

*/