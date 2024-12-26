/*
Question: What are the top-paying Business Analyst jobs?
- Identify the top 10 highest-paying Business Analyst roles that are either available remotely or in the state of Texas, TX
- Focuses on job postings with specified salaries (remove nulls)
- Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Business Analysts, offering insights into employment options and associated location.
*/

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


/*
Key takeaways from the above query regarding the top business analyst jobs in 2023:

Salary Range: Top 10 paying business analyst roles span from $162,500 to $220,000, indicating significant salary potential in the field.
Diverse Employers: Companies like Noom, Uber, and Multicoin Capital are among those offering these high salaries, showing a broad interest across different industries ranging from tech, healthcare to cryptocurrency companies.
Job Title Variety: There's a high degree of diversity in job titles, from Business Strategy Analyst to Lead Business Intelligence Engineer, reflecting varied roles and specializations within business analytics.
Location: 7 of the top 10 results from this query are remote jobs, with the other 3 based either in San Antonio or Irving. This suggests that there are in-person opportunities for business analysts in Texas

RESULTS FROM THE ABOVE QUERY 
-----------------------------

[
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "220000.0",
    "job_posted_date": "2023-08-29 18:26:36",
    "company_name": "Noom"
  },
  {
    "job_id": 112859,
    "job_title": "Manager II, Applied Science - Marketplace Dynamics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "214500.0",
    "job_posted_date": "2023-12-18 08:02:37",
    "company_name": "Uber"
  },
  {
    "job_id": 998056,
    "job_title": "Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-10-04 11:01:48",
    "company_name": "Multicoin Capital"
  },
  {
    "job_id": 1069582,
    "job_title": "Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-12-21 13:01:17",
    "company_name": "Multicoin Capital"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "190000.0",
    "job_posted_date": "2023-06-21 18:11:35",
    "company_name": "Harnham"
  },
  {
    "job_id": 937271,
    "job_title": "Lead Analytic Consultant",
    "job_location": "Irving, TX",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "172500.0",
    "job_posted_date": "2023-01-07 08:01:17",
    "company_name": "CVS Health"
  },
  {
    "job_id": 416185,
    "job_title": "Staff Revenue Operations Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170500.0",
    "job_posted_date": "2023-12-21 09:50:43",
    "company_name": "Gladly"
  },
  {
    "job_id": 1086284,
    "job_title": "Business Strategy Analyst Lead (San Antonio, TX)",
    "job_location": "San Antonio, TX",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167755.0",
    "job_posted_date": "2023-02-14 11:01:08",
    "company_name": "USAA"
  },
  {
    "job_id": 1035043,
    "job_title": "Business Strategy Analyst Lead-Marketing & Offer Strategy (San...",
    "job_location": "San Antonio, TX",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167755.0",
    "job_posted_date": "2023-02-23 08:02:02",
    "company_name": "USAA"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "162500.0",
    "job_posted_date": "2023-10-11 12:01:45",
    "company_name": "CyberCoders"
  }
]