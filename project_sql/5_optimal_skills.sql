/*WITH skills_demand AS (
 SELECT
 sd.skills,
 sd.skill_id,
 COUNT(sj.job_id) as skill_count
 FROM job_postings_fact AS jp
 INNER JOIN skills_job_dim AS sj ON jp.job_id = sj.job_id
 INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
 WHERE job_title_short = 'Data Analyst'
 AND job_work_from_home = True AND 
 salary_year_avg IS NOT NULL
 GROUP BY sd.skills, sd.skill_id),
 average_salary AS (
 SELECT 
 ROUND(AVG(salary_year_avg), 0) AS salary_avg,
 sj.skill_id
 FROM job_postings_fact AS jp
 LEFT JOIN skills_job_dim AS sj
 ON jp.job_id = sj.job_id
 INNER JOIN skills_dim AS sd
 ON sj.skill_id = sd.skill_id
 WHERE job_title_short = 'Data Analyst' AND
 salary_year_avg IS NOT NULL AND
 job_work_from_home = True
 GROUP BY  sj.skill_id)      
 SELECT
 skills_demand.skill_id,
 skills_demand.skills,
 skill_count,
 salary_avg
 FROM skills_demand
 LEFT JOIN average_salary 
 ON skills_demand.skill_id = average_salary.skill_id
 WHERE skill_count > 10
 ORDER BY 
 salary_avg DESC,
 skill_count DESC
 LIMIT 25; */
SELECT skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) as skill_count,
    ROUND(AVG(salary_year_avg), 0) AS salary_avg
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY salary_avg DESC,
    skill_count DESC
LIMIT 25;