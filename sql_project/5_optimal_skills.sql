WITH skills_demand AS (
    SELECT 
        skill_id,
        skills AS skill,
        COUNT(job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        USING (job_id)
    INNER JOIN skills_dim 
        USING (skill_id)
    WHERE 
        job_title_short = 'Data Analyst'
    GROUP BY 
        skill_id, 
        skills
), 
average_salary AS (
    SELECT 
        skill_id,
        skills AS skill,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary_per_skill
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        USING (job_id)
    INNER JOIN skills_dim 
        USING (skill_id)
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        skill_id, 
        skills
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skill,
    demand_count,
    avg_salary_per_skill
FROM skills_demand
INNER JOIN average_salary 
    USING (skill_id)
WHERE 
    demand_count > 9
ORDER BY 
    avg_salary_per_skill DESC,
    demand_count DESC
LIMIT 25;
