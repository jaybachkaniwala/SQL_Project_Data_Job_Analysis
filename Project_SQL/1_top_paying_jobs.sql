/*
Question: What are the top-paying Business Analyst jobs?
- Identify the top 10 highest-paying Business Analyst roles that are either available remotely or in Dallas,TX
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
    (job_location IN ('Anywhere', 'Dallas,TX')) AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10


/*
Key takeaways from the above query regarding the top business analyst jobs in 2023:

Salary Range: Top 10 paying business analyst roles span from $134,550 to $220,000, indicating significant salary potential in the field.
Diverse Employers: Companies like Noom, Uber, and Multicoin Capital are among those offering these high salaries, showing a broad interest across different industries ranging from large well known MNC's to Cryptocurrency companies.
Job Title Variety: There's a high degree of diversity in job titles, from Marketing Analytics Manager to Lead Business Intelligence Engineer, reflecting varied roles and specializations within business analytics.
Location: All of the top 10 highest paying business analyst jobs are remote jobs. Based on this we can determine that Dallas based business analyst jobs are paying less than $134,550.

RESULTS FROM THE ABOVE QUERY 
-----------------------------

"job_id": 502610
"job_title": "Lead Business Intelligence Engineer" 
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "220000.0"
"job_posted_date": "2023-08-29 18:26:36"
"company_name": "Noom"

"job_id": 112859
"job_title": "Manager II, Applied Science - Marketplace Dynamics" 
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "214500.0"
"job_posted_date": "2023-12-18 08:02:37"
"company_name": "Uber"

"job_id": 998056
"job_title": "Analyst" 
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "200000.0"
"job_posted_date": "2023-10-04 11:01:48"
"company_name": "Multicoin Capital"

"job_id": 1069582
"job_title": "Analyst" 
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "200000.0"
"job_posted_date": "2023-12-21 13:01:17"
"company_name": "Multicoin Capital"

"job_id": 17458
"job_title": "Senior Economy Designer"
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "190000.0"
"job_posted_date": "2023-06-21 18:11:35"
"company_name": "Harnham"

"job_id": 416185
"job_title": "Staff Revenue Operations Analyst"
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "170500.0"
"job_posted_date": "2023-06-21 18:11:35"
"company_name": "Gladly"

"job_id": 1099753
"job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP"
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "162500.0"
"job_posted_date": "2023-10-11 12:01:45"
"company_name": "CyberCoders"

"job_id": 1313937
"job_title": "Manager Analytics and Reporting"
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "145000.0"
"job_posted_date": "2023-06-22 13:01:41"
"company_name": "CyberCoders"

"job_id": 106225
"job_title": "Business Strategy Analyst Senior (Hybrid)"
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "138640.0"
"job_posted_date": "2023-06-30 14:01:54"
"company_name": "USAA"

"job_id": 661103
"job_title": "Marketing Analytics Manager"
"job_location": "Anywhere"
"job_schedule_type": "Full-time"
"salary_year_avg": "13455.0"
"job_posted_date": "2023-08-03 19:59:22" 
"company_name": "Get It Recruit - Marketing"
*/



