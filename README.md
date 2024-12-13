Welcome to your new dbt project!

### This is my DACSS 690 Final Project
### My name is Kaushik Suryanarayanan.
### This project is a simple ETL Pipeline to obtain a list of employees hired within the last 3 months of when an initial list of employees was generated.
### Additionally, we want to compare this output with a future list of employees and see who is still working as of the date the future list is generated.
### This project is a proof of concept at my workplace to help streamline our data management.
### The goal is to implement this in such a way that we can quickly obtain the list of employees hired in a set period of time from any new list of employees.
### For privacy purposes, I have anonymized the data and added a Rand_ID as my primary key.
### The data source is from UMASS Human Resources. I have filtered the data to only include Dining Service Employees, and uploaded it to my GoogleQuery database, then extracted it with DBT.
### The data transformation is pretty straightforward; we find the employees hired in the last 3 months, compare them to the future list of employees, and determine who is still working and return their relevant information (Job Title, Start Date, Department, Grade, Rand_ID)
### We then load the transformed data back into BigQuery into a separate dataset (Final_Project_Data_Output) for our examination
### For this project, I automated with Prefect, so that every hour the dbt project runs and produces our aforementioned tables.
### Thank you for the semester!
