


{{ config(materialized='table') }}

-- models/employees_hired_last_3_months.sql

WITH recent_hires AS (
    SELECT 
       Rand_ID,
        `Job Title`,  --Job Title
        Grade, --Employee Grade
        Dept, --Department
        `Start Date`, --Date employee was hired/started working.
        SYSDATE,  -- SYSDATE is a column in my tables.
        DATE_DIFF(SYSDATE, `Start Date`, DAY) AS Days_Worked --Obtain the number of days employees have worked as of date of table generation.
    FROM `dacss-690-final-project.Final_Project_Data.Initial_List`
        
    
)

SELECT 
    Rand_ID,
    `Job Title`,  
    Grade,
    Dept,
    `Start Date`,
    Days_Worked
FROM 
    recent_hires
WHERE 
    `Start Date` >= DATE_SUB(SYSDATE, INTERVAL 3 MONTH)  --Filters for employees who have been hired withing last 3 months of table generation.