/*
Question: What are the most optimal skills to learn (i.e a skill that is in high demand and is also high-paying)?
- Identify skills in high demand that are also associated with high average salaries for Business Analyst roles
- Concentrates on remote positions or those based in Texas, TX with specified salaries
- Why? Identifies skills that offer job security (high demand) and financial reward (high salaries), 
    offering strategic insights for career development in business analysis

-- Identifies skills in high demand for Data Analyst roles (Query 3)

*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Business Analyst' AND 
        ((job_location LIKE '%, TX') OR (job_location = 'Anywhere'))
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id      
), average_salary AS (
SELECT
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_job_dim.skill_id 
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Analysis: 

Results

[
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "22",
    "avg_salary": "105969"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "38",
    "avg_salary": "104277"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "16",
    "avg_salary": "100308"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "16",
    "avg_salary": "100308"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "56",
    "avg_salary": "98794"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "88",
    "avg_salary": "95292"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "12",
    "avg_salary": "93139"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "29",
    "avg_salary": "92059"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "19",
    "avg_salary": "88182"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "63",
    "avg_salary": "87212"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "13",
    "avg_salary": "87075"
  }
]

*/
