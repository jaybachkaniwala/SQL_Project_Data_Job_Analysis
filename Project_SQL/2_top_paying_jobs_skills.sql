/*
Question: What skills are required for the top-paying Business Analyst jobs?
- Will be using the top 10 highest-paying Business Analyst jobs identified from the previous top paying jobs query
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

/* 
Analysis: 
- We can clearly see from the two visualizations above that Python is the skill that is the most required in the top-paying Business Analyst roles 
(that we identified earlier) that are either remote or bases in Texas. This is followed by SQL, Tableau, and Excel. 
- It appears that Python which is a more complex language to learn than say SQL, is needed for the higher-paying roles. 
- SQL, and Excel are still key skills too as you would expect in a business analyst role.
- This is valuable insight to job seekers that want to pursue a career in Business Analytics as these are the most relevant skills to learn and develop for such roles. 

Results:

[
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "sql"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "python"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "excel"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "tableau"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "looker"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "chef"
  },
  {
    "job_id": 112859,
    "job_title": "Manager II, Applied Science - Marketplace Dynamics",
    "job_location": "Anywhere",
    "salary_year_avg": "214500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "job_location": "Anywhere",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "sql"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "job_location": "Anywhere",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "job_location": "Anywhere",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "r"
  },
  {
    "job_id": 937271,
    "job_title": "Lead Analytic Consultant",
    "job_location": "Irving, TX",
    "salary_year_avg": "172500.0",
    "company_name": "CVS Health",
    "skills": "sql"
  },
  {
    "job_id": 937271,
    "job_title": "Lead Analytic Consultant",
    "job_location": "Irving, TX",
    "salary_year_avg": "172500.0",
    "company_name": "CVS Health",
    "skills": "azure"
  },
  {
    "job_id": 937271,
    "job_title": "Lead Analytic Consultant",
    "job_location": "Irving, TX",
    "salary_year_avg": "172500.0",
    "company_name": "CVS Health",
    "skills": "snowflake"
  },
  {
    "job_id": 937271,
    "job_title": "Lead Analytic Consultant",
    "job_location": "Irving, TX",
    "salary_year_avg": "172500.0",
    "company_name": "CVS Health",
    "skills": "tableau"
  },
  {
    "job_id": 937271,
    "job_title": "Lead Analytic Consultant",
    "job_location": "Irving, TX",
    "salary_year_avg": "172500.0",
    "company_name": "CVS Health",
    "skills": "microstrategy"
  },
  {
    "job_id": 416185,
    "job_title": "Staff Revenue Operations Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "170500.0",
    "company_name": "Gladly",
    "skills": "excel"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "sql"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "python"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "r"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "snowflake"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "phoenix"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "excel"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "tableau"
  },
  {
    "job_id": 1086284,
    "job_title": "Business Strategy Analyst Lead (San Antonio, TX)",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "python"
  },
  {
    "job_id": 1086284,
    "job_title": "Business Strategy Analyst Lead (San Antonio, TX)",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "r"
  },
  {
    "job_id": 1086284,
    "job_title": "Business Strategy Analyst Lead (San Antonio, TX)",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "phoenix"
  },
  {
    "job_id": 1086284,
    "job_title": "Business Strategy Analyst Lead (San Antonio, TX)",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "excel"
  },
  {
    "job_id": 1086284,
    "job_title": "Business Strategy Analyst Lead (San Antonio, TX)",
    "job_location": "San Antonio, TX",
    "salary_year_avg": "167755.0",
    "company_name": "USAA",
    "skills": "tableau"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "sql"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "bigquery"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "gcp"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "looker"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "word"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "sheets"
  }
]
*/

