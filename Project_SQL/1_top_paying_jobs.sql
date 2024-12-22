/*
Question: What are the top-paying Business Analyst jobs?
- Identify the top 10 highest-paying Business Analyst roles that are either available remotely or in Dallas,TX
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
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
----------------------

"job_id","job_title","job_location","job_schedule_type","salary_year_avg","job_posted_date","company_name"
502610,"Lead Business Intelligence Engineer","Anywhere","Full-time","220000.0","2023-08-29 18:26:36","Noom"
112859,"Manager II, Applied Science - Marketplace Dynamics","Anywhere","Full-time","214500.0","2023-12-18 08:02:37","Uber"
998056,"Analyst","Anywhere","Full-time","200000.0","2023-10-04 11:01:48","Multicoin Capital"
1069582,"Analyst","Anywhere","Full-time","200000.0","2023-12-21 13:01:17","Multicoin Capital"
17458,"Senior Economy Designer","Anywhere","Full-time","190000.0","2023-06-21 18:11:35","Harnham"
416185,"Staff Revenue Operations Analyst","Anywhere","Full-time","170500.0","2023-12-21 09:50:43","Gladly"
1099753,"REMOTE - Business Intelligence Analyst (Leadership Role) - GCP","Anywhere","Full-time","162500.0","2023-10-11 12:01:45","CyberCoders"
1313937,"Manager Analytics and Reporting","Anywhere","Full-time","145000.0","2023-06-22 13:01:41","CyberCoders"
106225,"Business Strategy Analyst Senior (Hybrid)","Anywhere","Full-time","138640.0","2023-06-30 14:01:54","USAA"
661103,"Marketing Analytics Manager","Anywhere","Full-time","134550.0","2023-08-03 19:59:22","Get It Recruit - Marketing"
*/

