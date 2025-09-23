
    with skills_demand as (
        select skill_id,
            skills as skill,
            count(job_id) as demand_count
        FROM
            job_postings_fact
            inner join skills_job_dim using(job_id)
            inner join skills_dim using(skill_id)
        where
            job_title_short = 'Data Analyst'
        group by skill_id, skill
    ), 
    average_salary as (
        select skill_id,
            skills as skill,
            round(avg(salary_year_avg), 0) as avg_salary_per_skill
        FROM
            job_postings_fact
            inner join skills_job_dim using(job_id)
            inner join skills_dim using(skill_id)
        where
            job_title_short = 'Data Analyst'
            and salary_year_avg is not null
        group by skill_id, skill
    )

    select skills_demand.skill_id,
        skills_demand.skill,
        demand_count,
        avg_salary_per_skill
    from
        skills_demand
        join average_salary using(skill_id)
        where demand_count > 9
        order by avg_salary_per_skill desc,
        demand_count desc
        limit 25;
