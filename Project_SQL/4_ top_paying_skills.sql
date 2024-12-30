/*
Answer: What are the top-paying skills for a business analyst?
- Look at the average salary associated with each skill for Business Analyst positions
- Focuses on roles with specified salaries, regardless of location (this will provide us with a larger sample 
size than just remote or TX-based roles)
- Why? It reveals how different skills impact salary levels for Business Analysts and 
    helps to identify the most financially rewarding skills to acquire or improve upon.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
*Insert Visualization here from word doc*
Analysis: 

Technical Skills with Strong Salaries:

- Skills such as "numpy" ($157,500), "ruby" ($150,000), and "hadoop" ($139,201) highlight the 
importance of technical proficiencies in areas like programming, data processing/ Big Data, and analytics.

Popularity of Data Science Tools:

- More niche/specialized skills like "pandas" ($110,558), "scikit-learn" ($120,000), and "tensorflow" ($120,333)
 command higher salaries and are relevant even in Business Analyst roles.

Broad Spread of Skills and Salaries:

- The salary distribution shows a wide range of skill types, from programming languages ("c" at $123,329) to database tools 
("nosql" at $119,330, "mongodb" at $118,667). This variety demonstrates that there are multiple paths
 to high-paying roles depending on a candidate's expertise.

Results
[
  {
    "skills": "chef",
    "avg_salary": "220000"
  },
  {
    "skills": "numpy",
    "avg_salary": "157500"
  },
  {
    "skills": "ruby",
    "avg_salary": "150000"
  },
  {
    "skills": "hadoop",
    "avg_salary": "139201"
  },
  {
    "skills": "julia",
    "avg_salary": "136100"
  },
  {
    "skills": "airflow",
    "avg_salary": "135410"
  },
  {
    "skills": "phoenix",
    "avg_salary": "135248"
  },
  {
    "skills": "electron",
    "avg_salary": "131000"
  },
  {
    "skills": "c",
    "avg_salary": "123329"
  },
  {
    "skills": "pytorch",
    "avg_salary": "120333"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120333"
  },
  {
    "skills": "seaborn",
    "avg_salary": "120000"
  },
  {
    "skills": "matlab",
    "avg_salary": "120000"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "120000"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "120000"
  },
  {
    "skills": "nosql",
    "avg_salary": "119330"
  },
  {
    "skills": "mongodb",
    "avg_salary": "118667"
  },
  {
    "skills": "snowflake",
    "avg_salary": "112543"
  },
  {
    "skills": "looker",
    "avg_salary": "110581"
  },
  {
    "skills": "pandas",
    "avg_salary": "110558"
  },
  {
    "skills": "node.js",
    "avg_salary": "110000"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "110000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "110000"
  },
  {
    "skills": "chainer",
    "avg_salary": "110000"
  },
  {
    "skills": "cassandra",
    "avg_salary": "108488"
  }
]
*/