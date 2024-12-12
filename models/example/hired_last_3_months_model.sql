
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

-- models/employees_hired_last_3_months.sql

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
--    
)

SELECT 
    Rand_ID,
    `Job Title`,  -- Use backticks to reference column names with spaces
    Grade,
    Dept,
    `Start Date`
FROM 
    recent_hires
WHERE 
    `Start Date` >= DATE_SUB(SYSDATE, INTERVAL 3 MONTH)  -- Correct use of DATE_SUB and CAST