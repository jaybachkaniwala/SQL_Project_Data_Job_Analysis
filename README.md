# Introduction
A deep dive into the data on the job market with a particular focus on business analyst roles. This data analysis project explores 💸 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand skills meets high salary in business analytics.

🔍 SQL queries? They can be found here: [Project_SQL folder](/Project_SQL/)

# Data
Data from https://www.lukebarousse.com/sql

# Tools Used

- **SQL:** SQL was used to query the database allowing me me to extract valuable insights.
- **PostgreSQL:** The database management system (DBMS), used for handling the job posting data.
- **Tableau:** Data Visualization tool to display the SQL results to easily understand the results and gain insights.
- **Visual Studio Code:** Used for database management and executing SQL queries.
- **Git & GitHub:** Used for version control, project tracking and displaying my SQL scripts and analysis.

# Analysis 
The queries used were aimed to answer the following questions from the perspective of someone seeking a business analyst position:

1. What are the top-paying business analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for business analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn i.e skills that are in-demand as well as high-paying?

### 1. Top Paying Business Analyst Jobs (Based in TX, or Remote)
To identify the highest-paying roles, I filtered business analyst positions by average yearly salary and location, focusing on remote jobs or those based in Texas.

```sql
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
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
```

*Key Insights:*

[Bar Chart Visualization](/Data%20Visualization/1_top_paying_business_analyst_jobs.png)

- Salary Range: Top 10 paying business analyst roles span from $162,500 to $220,000, indicating significant salary potential in the field.

- Diverse Employers: Companies like Noom, Uber, and Multicoin Capital are among those offering these high salaries, showing a broad interest across different industries ranging from tech, healthcare to cryptocurrency companies.

- Job Title Variety: There's a high degree of diversity in job titles, from Business Strategy Analyst to Lead Business Intelligence Engineer, reflecting varied roles and specializations within business analytics.

- Location: 7 of the top 10 results from this query are remote jobs, with the other 3 based either in San Antonio or Irving. This suggests that there are in-person opportunities for business analysts in Texas.

### 2. Skills for the top Paying Business Analyst Jobs identified in 1.
To understand which skills are required for the top-paying jobs that we identified in query 1, I joined the job postings with the skills data.

```sql
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
```
*Key Insights:*

[Bar Chart Visualization](/Data%20Visualization/2_top_paying_jobs_skills.png)
[Word Cloud Visualization](/Data%20Visualization/2_word_cloud.png)

- We can clearly see from the two visualizations above that Python is the skill that is the most required in the top-paying Business Analyst roles 
(that we identified earlier) that are either remote or based in Texas. This is followed by SQL, Tableau, and Excel. 
- It appears that Python which is a more complex language to learn than say SQL, is needed for the higher-paying roles. 
- SQL, and Excel are still key skills too as you would expect for a business analyst role.
- This is valuable insight to job seekers that want to pursue a career in Business Analytics as these are the most relevant skills to learn and develop.

### 3. Most in-demand skills for a Business Analyst

This query was used to identify the skills most frequently requested in job postings for a Business Analyst.

```sql
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
```
*Key Insights:*
[Visualization](/Data%20Visualization/3_%20most_indemand_skills.png)

| Skills   | Demand Count |
|----------|--------------|
| SQL      | 1890         |
| Excel    | 1570  
  Tableau  | 1084 
  Power BI | 820          |
| Python   | 791       |        

*Table of the demand for the top 5 skills in business analyst job postings*

- For business analysts roles (remote or TX-based), the most in-demand skill is SQL, followed by Excel and Tableau. 
- We saw from our previous query analysis that for the highest-paying business analyst roles, Python was the skill which was most commonly requested, but now with a larger dataset,  We can see that Python is actually the 5th most demanded skill for a business analyst.
- The need for SQL, and Excel skills suggests that data processing/manipulation along with spreadsheet skills are vital.
- Visualization tools such as Tableau and Power BI, are also key in such a role to be able to effectively display complex data in a impactful way which aids decision-making.
- This is insightful for aspiring business analysts, as they can use this analysis to identify the skills they should be developing in order to land a business analyst role.

### 4. Top-paying skills for a Business Analyst

Looking at the average salary associated with each skill for Business Analyst positions. Focusing on roles with specified salaries, regardless of location (this will provide us with a larger sample size than just remote or TX-based roles)

```sql
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
```
*Key Insights:*
[Visualization](/Data%20Visualization/4_top_paying_skills.png)

| Skills          | Avg Salary |
|-----------------|------------|
| Chef            | 220,000     |
| Numpy           | 157,500     |
| Ruby            | 150,000     |
| Hadoop          | 139,201     |
| Julia           | 136,100     |
| Airflow         | 135,410     |
| Phoenix         | 135,248     |
| Electron        | 131,000     |
| C               | 123,329     |
| PyTorch         | 120,333     |
| TensorFlow      | 120,333     |
| Seaborn         | 120,000     |
| MATLAB          | 120,000     |
| Matplotlib      | 120,000     |
| Scikit-learn    | 120,000     |
| NoSQL           | 119,330     |
| MongoDB         | 118,667     |
| Snowflake       | 112,543     |
| Looker          | 110,581     |
| Pandas          | 110,558     |
| Node.js         | 110,000     |
| Elasticsearch   | 110,000     |
| MXNet           | 110,000     |
| Chainer         | 110,000     |
| Cassandra       | 108,488     |

*Table of the average salary for the top 15 highest-paying skills for business analysts*

*Technical Skills with Strong Salaries:*

- Skills such as "numpy" ($157,500), "ruby" ($150,000), and "hadoop" ($139,201) highlight the importance of technical proficiencies in areas like programming, data processing/ Big Data, and analytics.

*Popularity of Data Science Tools:*

- More niche/specialized skills like "pandas" ($110,558), "scikit-learn" ($120,000), and "tensorflow" ($120,333) command higher salaries and are relevant even in Business Analyst roles.

*Broad Spread of Skills and Salaries:*

- The salary distribution shows a wide range of skill types, from programming languages ("c" at $123,329) to database tools ("nosql" at $119,330, "mongodb" at $118,667). 
- This variety demonstrates that there are multiple paths to high-paying roles depending on a candidate's expertise.

### 5. Most Optimal Skills to Learn
Using the analysis from queries 3 & 4 we can combine this to identify skills that are both in high demand and have high salaries, offering strategic insights for career development in business analysis.

```sql
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
```
*Key Insights:*
[Visualization](/Data%20Visualization/5_optimal_skills.png)

| Skill ID | Skills      | Demand Count | Avg Salary |
|----------|-------------|--------------|------------|
| 5        | R           | 22           | 105,969     |
| 1        | Python      | 38           | 104,277     |
| 7        | SAS         | 16           | 100,308     |
| 182      | Tableau     | 56           | 98,794      |
| 0        | SQL         | 88           | 95,292      |
| 79       | Oracle      | 12           | 93,139      |
| 183      | Power BI    | 29           | 92,059      |
| 196      | PowerPoint  | 19           | 88,182      |
| 181      | Excel       | 63           | 87,212      |
| 188      | Word        | 13           | 87,075      |

*Table of the most optimal skills for a business analyst sorted by salary*

*Highest Paying Skills:*
- R has the highest average salary at $105,969, followed closely by Python at $104,277.
- These skills are in high demand for roles involving data science and advanced analytics.

*Demand vs. Salary:*
- SQL has the highest demand (88 job postings) but a comparatively lower average salary of $95,292.
- This indicates SQL is a foundational skill, widely required but not specialized enough to command premium salaries.

*Specialized Tools vs. General Tools:*
- Tools like R, Python, and SAS command higher salaries, reflecting their specialized application in advanced data analysis.
- General-purpose tools like Excel and Word have lower average salaries ($87,212 and $87,075, respectively), 
even though they are widely used (Excel: 63 job postings).

*Visualization Tools in Demand:*
- Tableau and Power BI are popular visualization tools:
- Tableau: 56 postings, $98,794 average salary.
- Power BI: 29 postings, $92,059 average salary.
- These tools are essential for business intelligence roles, and proficiency in them is a valuable skill for a Business Analyst.

*General Observations:*
- Specialized programming and data analysis skills (e.g., Python, R, SAS) are associated with higher average salaries.
- The demand for fundamental tools like SQL and Excel remains high, but they typically yield lower compensation than more specialized or less commonly mastered skills.

# Conclusion / Key Takeaways

*Why These Insights Matter for a Job Seeker*

Skill Prioritization:
- Focusing on learning or enhancing expertise in Python, R, and Tableau can lead to better salary prospects.
- Mastery of SQL is critical for landing roles, as it is highly in demand.

Job Role Alignment:
- For high-paying roles, targeting advanced data science, business intelligence, 
or analytics positions that heavily leverage Python, R, and tools like Tableau is a good strategy.

Balancing Breadth and Depth:
- While broad skills like SQL and Excel are foundational, combining them with specialized skills like Python or Tableau can make a candidate more versatile and competitive.

# What I learned from this project ✅
During this project, I gained practical experience in advanced SQL concepts and techniques, which enhanced my ability to work with complex datasets and derive meaningful insights. Key learnings included:

✅ Joining Multiple Tables: I mastered combining data from multiple tables using various types of joins (INNER and LEFT) to analyze relational data effectively.

✅ Common Table Expressions (CTEs): I utilized CTEs to simplify and organize complex queries, making them more readable and reusable for detailed analysis.

✅ Aggregate Functions: I applied functions like COUNT() and AVG() to summarize and analyze large datasets efficiently, helping to uncover trends and patterns.

✅ Data Visualization with Tableau: I integrated SQL with Tableau to visualize query results, creating intuitive visualizations that made it easier to interpret data and communicate insights for the intended audience.

✅Insights and Business Decisions: By combining SQL analysis and visualizations, I was able to identify key trends, and actionable insights that could drive data-informed decision-making.

This project not only strengthened my SQL and data visualization skills but also highlighted the importance of leveraging data tools to solve real-world business problems.


