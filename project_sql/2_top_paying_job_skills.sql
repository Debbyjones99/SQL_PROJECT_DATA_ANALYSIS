WITH top_1O AS(
    SELECT jp.job_id,
        jp.job_title,
        cd.name AS company_name,
        jp.salary_year_avg
    FROM job_postings_fact AS jp
        LEFT JOIN company_dim AS cd ON cd.company_id = jp.company_id
    WHERE job_location = 'Anywhere'
        AND job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT Null
    GROUP BY job_id,
        cd.name
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT tp.*,
    sk.skills
FROM top_1O AS tp
    INNER JOIN skills_job_dim AS sj ON tp.job_id = sj.job_id
    INNER JOIN skills_dim AS sk ON sj.skill_id = sk.skill_id
ORDER BY salary_year_avg DESC
    /*  Key Insights:
     SQL and Python dominate: SQL (used for data querying) and Python (used for scripting and automation) are the most demanded skills.
     
     Visualization matters: Tableau ranks high, showing how important it is for communicating insights.
     
     R is still relevant: Especially for statistical analysis-heavy roles.
     
     Cloud and version control skills: Cloud platforms like Azure and tools like Bitbucket are emerging as valuable additions.
     
     Excel isn’t dead: It’s still one of the top tools for data analysis in high-paying roles.*/
    /* [
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 1,
     "skill_id (1)": 1,
     "skills": "python",
     "type": "programming"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 5,
     "skill_id (1)": 5,
     "skills": "r",
     "type": "programming"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 74,
     "skill_id (1)": 74,
     "skills": "azure",
     "type": "cloud"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 75,
     "skill_id (1)": 75,
     "skills": "databricks",
     "type": "cloud"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 76,
     "skill_id (1)": 76,
     "skills": "aws",
     "type": "cloud"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 93,
     "skill_id (1)": 93,
     "skills": "pandas",
     "type": "libraries"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 95,
     "skill_id (1)": 95,
     "skills": "pyspark",
     "type": "libraries"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 102,
     "skill_id (1)": 102,
     "skills": "jupyter",
     "type": "libraries"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 181,
     "skill_id (1)": 181,
     "skills": "excel",
     "type": "analyst_tools"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 182,
     "skill_id (1)": 182,
     "skills": "tableau",
     "type": "analyst_tools"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 183,
     "skill_id (1)": 183,
     "skills": "power bi",
     "type": "analyst_tools"
     },
     {
     "job_id": 552322,
     "job_title": "Associate Director- Data Insights",
     "company_name": "AT&T",
     "salary_year_avg": "255829.5",
     "job_id (1)": 552322,
     "skill_id": 196,
     "skill_id (1)": 196,
     "skills": "powerpoint",
     "type": "analyst_tools"
     },
     {
     "job_id": 99305,
     "job_title": "Data Analyst, Marketing",
     "company_name": "Pinterest Job Advertisements",
     "salary_year_avg": "232423.0",
     "job_id (1)": 99305,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 99305,
     "job_title": "Data Analyst, Marketing",
     "company_name": "Pinterest Job Advertisements",
     "salary_year_avg": "232423.0",
     "job_id (1)": 99305,
     "skill_id": 1,
     "skill_id (1)": 1,
     "skills": "python",
     "type": "programming"
     },
     {
     "job_id": 99305,
     "job_title": "Data Analyst, Marketing",
     "company_name": "Pinterest Job Advertisements",
     "salary_year_avg": "232423.0",
     "job_id (1)": 99305,
     "skill_id": 5,
     "skill_id (1)": 5,
     "skills": "r",
     "type": "programming"
     },
     {
     "job_id": 99305,
     "job_title": "Data Analyst, Marketing",
     "company_name": "Pinterest Job Advertisements",
     "salary_year_avg": "232423.0",
     "job_id (1)": 99305,
     "skill_id": 97,
     "skill_id (1)": 97,
     "skills": "hadoop",
     "type": "libraries"
     },
     {
     "job_id": 99305,
     "job_title": "Data Analyst, Marketing",
     "company_name": "Pinterest Job Advertisements",
     "salary_year_avg": "232423.0",
     "job_id (1)": 99305,
     "skill_id": 182,
     "skill_id (1)": 182,
     "skills": "tableau",
     "type": "analyst_tools"
     },
     {
     "job_id": 1021647,
     "job_title": "Data Analyst (Hybrid/Remote)",
     "company_name": "Uclahealthcareers",
     "salary_year_avg": "217000.0",
     "job_id (1)": 1021647,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 1021647,
     "job_title": "Data Analyst (Hybrid/Remote)",
     "company_name": "Uclahealthcareers",
     "salary_year_avg": "217000.0",
     "job_id (1)": 1021647,
     "skill_id": 23,
     "skill_id (1)": 23,
     "skills": "crystal",
     "type": "programming"
     },
     {
     "job_id": 1021647,
     "job_title": "Data Analyst (Hybrid/Remote)",
     "company_name": "Uclahealthcareers",
     "salary_year_avg": "217000.0",
     "job_id (1)": 1021647,
     "skill_id": 79,
     "skill_id (1)": 79,
     "skills": "oracle",
     "type": "cloud"
     },
     {
     "job_id": 1021647,
     "job_title": "Data Analyst (Hybrid/Remote)",
     "company_name": "Uclahealthcareers",
     "salary_year_avg": "217000.0",
     "job_id (1)": 1021647,
     "skill_id": 182,
     "skill_id (1)": 182,
     "skills": "tableau",
     "type": "analyst_tools"
     },
     {
     "job_id": 1021647,
     "job_title": "Data Analyst (Hybrid/Remote)",
     "company_name": "Uclahealthcareers",
     "salary_year_avg": "217000.0",
     "job_id (1)": 1021647,
     "skill_id": 215,
     "skill_id (1)": 215,
     "skills": "flow",
     "type": "other"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 1,
     "skill_id (1)": 1,
     "skills": "python",
     "type": "programming"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 8,
     "skill_id (1)": 8,
     "skills": "go",
     "type": "programming"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 80,
     "skill_id (1)": 80,
     "skills": "snowflake",
     "type": "cloud"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 93,
     "skill_id (1)": 93,
     "skills": "pandas",
     "type": "libraries"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 94,
     "skill_id (1)": 94,
     "skills": "numpy",
     "type": "libraries"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 181,
     "skill_id (1)": 181,
     "skills": "excel",
     "type": "analyst_tools"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 182,
     "skill_id (1)": 182,
     "skills": "tableau",
     "type": "analyst_tools"
     },
     {
     "job_id": 168310,
     "job_title": "Principal Data Analyst (Remote)",
     "company_name": "SmartAsset",
     "salary_year_avg": "205000.0",
     "job_id (1)": 168310,
     "skill_id": 220,
     "skill_id (1)": 220,
     "skills": "gitlab",
     "type": "other"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 1,
     "skill_id (1)": 1,
     "skills": "python",
     "type": "programming"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 74,
     "skill_id (1)": 74,
     "skills": "azure",
     "type": "cloud"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 76,
     "skill_id (1)": 76,
     "skills": "aws",
     "type": "cloud"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 79,
     "skill_id (1)": 79,
     "skills": "oracle",
     "type": "cloud"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 80,
     "skill_id (1)": 80,
     "skills": "snowflake",
     "type": "cloud"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 182,
     "skill_id (1)": 182,
     "skills": "tableau",
     "type": "analyst_tools"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 183,
     "skill_id (1)": 183,
     "skills": "power bi",
     "type": "analyst_tools"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 189,
     "skill_id (1)": 189,
     "skills": "sap",
     "type": "analyst_tools"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 211,
     "skill_id (1)": 211,
     "skills": "jenkins",
     "type": "other"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 218,
     "skill_id (1)": 218,
     "skills": "bitbucket",
     "type": "other"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 219,
     "skill_id (1)": 219,
     "skills": "atlassian",
     "type": "other"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 233,
     "skill_id (1)": 233,
     "skills": "jira",
     "type": "async"
     },
     {
     "job_id": 731368,
     "job_title": "Director, Data Analyst - HYBRID",
     "company_name": "Inclusively",
     "salary_year_avg": "189309.0",
     "job_id (1)": 731368,
     "skill_id": 234,
     "skill_id (1)": 234,
     "skills": "confluence",
     "type": "async"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 1,
     "skill_id (1)": 1,
     "skills": "python",
     "type": "programming"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 5,
     "skill_id (1)": 5,
     "skills": "r",
     "type": "programming"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 210,
     "skill_id (1)": 210,
     "skills": "git",
     "type": "other"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 218,
     "skill_id (1)": 218,
     "skills": "bitbucket",
     "type": "other"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 219,
     "skill_id (1)": 219,
     "skills": "atlassian",
     "type": "other"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 233,
     "skill_id (1)": 233,
     "skills": "jira",
     "type": "async"
     },
     {
     "job_id": 310660,
     "job_title": "Principal Data Analyst, AV Performance Analysis",
     "company_name": "Motional",
     "salary_year_avg": "189000.0",
     "job_id (1)": 310660,
     "skill_id": 234,
     "skill_id (1)": 234,
     "skills": "confluence",
     "type": "async"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 1,
     "skill_id (1)": 1,
     "skills": "python",
     "type": "programming"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 8,
     "skill_id (1)": 8,
     "skills": "go",
     "type": "programming"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 80,
     "skill_id (1)": 80,
     "skills": "snowflake",
     "type": "cloud"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 93,
     "skill_id (1)": 93,
     "skills": "pandas",
     "type": "libraries"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 94,
     "skill_id (1)": 94,
     "skills": "numpy",
     "type": "libraries"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 181,
     "skill_id (1)": 181,
     "skills": "excel",
     "type": "analyst_tools"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 182,
     "skill_id (1)": 182,
     "skills": "tableau",
     "type": "analyst_tools"
     },
     {
     "job_id": 1749593,
     "job_title": "Principal Data Analyst",
     "company_name": "SmartAsset",
     "salary_year_avg": "186000.0",
     "job_id (1)": 1749593,
     "skill_id": 220,
     "skill_id (1)": 220,
     "skills": "gitlab",
     "type": "other"
     },
     {
     "job_id": 387860,
     "job_title": "ERM Data Analyst",
     "company_name": "Get It Recruit - Information Technology",
     "salary_year_avg": "184000.0",
     "job_id (1)": 387860,
     "skill_id": 0,
     "skill_id (1)": 0,
     "skills": "sql",
     "type": "programming"
     },
     {
     "job_id": 387860,
     "job_title": "ERM Data Analyst",
     "company_name": "Get It Recruit - Information Technology",
     "salary_year_avg": "184000.0",
     "job_id (1)": 387860,
     "skill_id": 1,
     "skill_id (1)": 1,
     "skills": "python",
     "type": "programming"
     },
     {
     "job_id": 387860,
     "job_title": "ERM Data Analyst",
     "company_name": "Get It Recruit - Information Technology",
     "salary_year_avg": "184000.0",
     "job_id (1)": 387860,
     "skill_id": 5,
     "skill_id (1)": 5,
     "skills": "r",
     "type": "programming"
     }
     ]
     */