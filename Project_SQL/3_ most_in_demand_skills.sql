/*
Question: What are the most in-demand skills for business analysts?
- Inner join job postings table to skills_job_dim & skills_dim tables
- Identify the top 5 in-demand skills for a business analyst
- Why? Retrieves the top 5 skills with the highest demand in the job market for a business analyst, 
    providing insights into the most valuable skills for job seekers
- This differs from previous query as that only looked at the skills required for the top 10 highest paying business analyst roles 
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
     job_title_short = 'Business Analyst' AND 
     ((job_location LIKE '%, TX') OR (job_location = 'Anywhere'))
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5   

/*
* Insert Visualization from Word Doc here*
Analysis: 
-For business analysts roles (remote or TX-based), the most in-demand skill is SQL, followed by Excel and Tableau. 
-We saw from our previous query analysis that for the highest-paying business analyst roles, 
Python was the skill which was most commonly requested, but now with a larger dataset, 
we can see that Python is actually the 5th most demanded skill for a business analyst
- The need for SQL, and Excel skills suggests that data processing/manipulation along with spreadsheet skills are vital
- Visualization tools such as Tableau and Power BI, are also key in such a role to be able to effectively display complex
data in a impactful way which aids decision-making.
-This is insightful for aspiring business analysts, as they can use this analysis to identify the skills
they should be developing to land a business analysis role

Results
[
  {
    "skills": "sql",
    "demand_count": "1890"
  },
  {
    "skills": "excel",
    "demand_count": "1570"
  },
  {
    "skills": "tableau",
    "demand_count": "1084"
  },
  {
    "skills": "power bi",
    "demand_count": "820"
  },
  {
    "skills": "python",
    "demand_count": "791"
  }
]
*/