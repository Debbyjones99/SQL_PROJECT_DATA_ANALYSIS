SELECT ROUND(AVG(salary_year_avg), 0) AS salary_avg,
    skills
FROM job_postings_fact AS jp
    LEFT JOIN skills_job_dim AS sj ON jp.job_id = sj.job_id
    INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY skills
ORDER BY salary_avg DESC
LIMIT 25;