SELECT jp.job_id,
    jp.job_title,
    jp.job_location,
    jp.job_schedule_type,
    cd.name AS company_name,
    jp.salary_year_avg,
    jp.job_posted_date
FROM job_postings_fact AS jp
    LEFT JOIN company_dim AS cd ON cd.company_id = jp.company_id
WHERE job_location = 'Anywhere'
    AND job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT Null
GROUP BY job_id,
    cd.name
ORDER BY salary_year_avg DESC
LIMIT 10;