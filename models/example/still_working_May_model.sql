
-- Use the `ref` function to select from other models

-- models/employees_still_working_in_may.sql

-- models/employees_still_working_in_may.sql
{{ config(materialized='table') }}

WITH recent_hires AS (
    SELECT 
        Rand_ID,
        `Job Title`,  -- Use backticks to reference column names with spaces
        Grade,
        Dept,
        `Start Date`,
        SYSDATE  -- Assuming SYSDATE is a column in the Jan_2024 table
    FROM 
        `dacss-690-final-project.Final_Project_Data.Jan_2024`
),
still_working AS (
    SELECT 
        Rand_ID,
        `Job Title`,  -- Use backticks to reference column names with spaces
        Grade,
        Dept
    FROM 
        `dacss-690-final-project.Final_Project_Data.May_2024`
)

SELECT 
    r.Rand_ID,
    r.`Job Title`,  -- Use backticks to reference column names with spaces
    r.Grade,
    r.Dept,
    r.`Start Date`
FROM 
    recent_hires r
JOIN 
    still_working s ON r.Rand_ID = s.Rand_ID    
WHERE 
    r.`Start Date` >= DATE_SUB(CAST(r.SYSDATE AS DATE), INTERVAL 3 MONTH)  -- Employees hired in the last 3 months from SYSDATE    
-- Find employees who are still working in May_2024
