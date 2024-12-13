from prefect import task, flow
from datetime import timedelta
import subprocess

# Define a task to run dbt commands
@task
def run_dbt_command(command: str, project_dir: str):
    result = subprocess.run(command, shell=True, cwd=project_dir, capture_output=True, text=True)

    # Print the command that is being executed
    print(f"Executing DBT command: {command}")
    
    # Print stdout and stderr explicitly
    print(f"stdout: {result.stdout}")
    print(f"stderr: {result.stderr}")
    
    # Save the output to a log file for detailed logging
    with open("dbt_command_output.log", "w") as log_file:
        log_file.write(f"Executing DBT command: {command}\n")
        log_file.write(f"stdout:\n{result.stdout}\n")
        log_file.write(f"stderr:\n{result.stderr}\n")
    
    # Check for any errors and raise an exception with stderr
    if result.returncode != 0:
        raise Exception(f"DBT command failed with error:\n{result.stderr}")


# Define the flow that runs dbt commands
@flow
def dbt_flow():
    # Path to your dbt project
    project_dir = r"D:\UMASS Amherst DACSS\DACSS_690_Final_Project\dbt-final-project\dbt_final_project"
    
    # Run dbt commands
    print(run_dbt_command("dbt deps --debug", project_dir))  # Install dependencies
    print(run_dbt_command("dbt seed --debug", project_dir))  # Load data into the warehouse
    print(run_dbt_command("dbt run --debug", project_dir))   # Run dbt models
    print(run_dbt_command("dbt test --debug", project_dir))  # Run dbt tests



if __name__ == "__main__":
    dbt_flow()
