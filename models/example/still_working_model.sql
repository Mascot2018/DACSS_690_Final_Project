
-- Use the `ref` function to select from other models

-- models/employees_still_working_in_may.sql

-- models/employees_still_working_in_may.sql
{{ config(materialized='table') }}

WITH recent_hires AS (
    SELECT 
        Rand_ID,
        `Job Title`,  --Job Title
        Grade, --Employee Grade
        Dept, --Department employee works in.
        `Start Date`, --date employee was hired/started working.
        SYSDATE  -- Column in our  table that describes when table was generated
    FROM `dacss-690-final-project.Final_Project_Data.Initial_List`
),
still_working AS (
    SELECT 
        Rand_ID,
        `Job Title`,  -- Use backticks to reference column names with spaces
        Grade,
        Dept,
        DATE_DIFF(SYSDATE, `Start Date`, DAY) AS Days_Worked
    FROM `dacss-690-final-project.Final_Project_Data.Final_List`
)

SELECT 
    r.Rand_ID,
    r.`Job Title`,  
    r.Grade,
    r.Dept,
    r.`Start Date`,
    s.Days_Worked
FROM 
    recent_hires r 
JOIN
    still_working s ON r.Rand_ID = s.Rand_ID    
WHERE 
    r.`Start Date` >= DATE_SUB(CAST(r.SYSDATE AS DATE), INTERVAL 3 MONTH)  -- Employees hired in the last 3 months from SYSDATE    
-- Find employees who are still working in May_2024
