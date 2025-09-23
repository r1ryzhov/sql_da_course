select skills as skill,
    round(avg(salary_year_avg), 0) as avg_salary_per_skill,
    count(skills) as quantity_of_vacancies
FROM
    job_postings_fact
    inner join skills_job_dim using(job_id)
    inner join skills_dim using(skill_id)
where
    job_title_short = 'Data Analyst'
    and salary_year_avg is not null
group by 1
order by 2 desc
limit 20;

/*
Навыки с самой высокой средней зарплатой

Навыки svn и solidity имеют самые высокие зарплаты, но при этом у них всего по одной вакансии, что может указывать на узкоспециализированные или нишевые должности.
С другой стороны, такие навыки, как Kafka, Pytorch и Perl, имеют более низкую среднюю зарплату по сравнению с лидерами списка, но при этом обладают значительно более высоким спросом.

*/