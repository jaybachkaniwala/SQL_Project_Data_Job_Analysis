/*
Question: What skills are required for the top-paying Business Analyst jobs?
- Will be using the top 10 highest-paying Business Analyst jobs identified from the first query
- Add the specific skills required for these roles
- Why? This will provide a detailed look at the exact skills that are required in these high-paying jobs, 
    helping job seekers understand which skills to develop
*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Business Analyst' AND 
        ((job_location LIKE '%, TX') OR (job_location = 'Anywhere')) AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;


