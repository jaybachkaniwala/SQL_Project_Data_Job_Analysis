/*
Question: What are the most optimal skills to learn (i.e a skill that is in high demand and is also high-paying)?
- Identify skills in high demand that are also associated with high average salaries for Business Analyst roles
- Concentrates on remote positions or those based in Texas, TX with specified salaries
- Why? Identifies skills that offer job security (high demand) and financial reward (high salaries), 
    offering strategic insights for career development in business analysis

- We can combine queries 3 and 4 to help with this analysis.
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
    AND ((job_location LIKE '%, TX') OR (job_location = 'Anywhere'))
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

Highest Paying Skills:
- R has the highest average salary at $105,969, followed closely by Python at $104,277.
- These skills are in high demand for roles involving data science and advanced analytics.

Demand vs. Salary:
- SQL has the highest demand (88 job postings) but a comparatively lower average salary of $95,292.
- This indicates SQL is a foundational skill, widely required but not specialized enough to command premium salaries.

Specialized Tools vs. General Tools:
- Tools like R, Python, and SAS command higher salaries, reflecting their specialized application in advanced data analysis.
- General-purpose tools like Excel and Word have lower average salaries ($87,212 and $87,075, respectively), 
even though they are widely used (Excel: 63 job postings).

Visualization Tools in Demand:
- Tableau and Power BI are popular visualization tools:
- Tableau: 56 postings, $98,794 average salary.
- Power BI: 29 postings, $92,059 average salary.
- These tools are essential for business intelligence roles, and proficiency in them is a valuable skill for a Business Analyst.

General Observations:
- Specialized programming and data analysis skills (e.g., Python, R, SAS) are associated with higher average salaries.
- The demand for fundamental tools like SQL and Excel remains high, but they typically yield lower 
  compensation than more specialized or less commonly mastered skills.

Why These Insights Matter for a Job Seeker:

Skill Prioritization:
- Focusing on learning or enhancing expertise in Python, R, and Tableau can lead to better salary prospects.
- Mastery of SQL is critical for landing roles, as it is highly in demand.

Job Role Alignment:
- For high-paying roles, targeting advanced data science, business intelligence, 
or analytics positions that heavily leverage Python, R, and tools like Tableau is a good strategy.

Balancing Breadth and Depth:
- While broad skills like SQL and Excel are foundational, combining them with specialized skills like Python or Tableau 
  makes you more competitive and versatile.

Results

[
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "22",
    "avg_salary": "113397"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "38",
    "avg_salary": "110606"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "56",
    "avg_salary": "106023"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "16",
    "avg_salary": "103319"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "16",
    "avg_salary": "103319"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "88",
    "avg_salary": "95902"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "12",
    "avg_salary": "92290"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "63",
    "avg_salary": "92234"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "29",
    "avg_salary": "86640"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "19",
    "avg_salary": "82908"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "13",
    "avg_salary": "80885"
  }
]
*/
