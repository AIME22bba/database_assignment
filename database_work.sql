-- Question 1: Concatenate first and last name as full_name
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- Question 2: Convert all employee names to lowercase
SELECT LOWER(first_name || ' ' || last_name) AS full_name_lowercase FROM employees;

-- Question 3: Extract first 3 letters of the employee's first name
SELECT LEFT(first_name, 3) AS first_three_letters FROM employees;

-- Question 4: Replace '@company.com' in email with '@org.com'
SELECT REPLACE(email, '@company.com', '@org.com') AS updated_email FROM employees;

-- Question 5: Trim spaces from a padded string
SELECT TRIM('   John Doe   ') AS trimmed_string;

-- Question 6: Count characters in an employee’s full name
SELECT LENGTH(first_name || ' ' || last_name) AS full_name_length FROM employees;

-- Question 7: Find position of '@' in email
SELECT POSITION('@' IN email) AS at_position FROM employees;

-- Question 8: Add ‘Mr.’ before names (assuming male for this example)
SELECT CONCAT('Mr. ', first_name, ' ', last_name) AS titled_name FROM employees;

-- Question 9: Format project names to uppercase
SELECT UPPER(project_name) AS project_name_upper FROM projects;

-- Question 10: Remove any dashes from project names
SELECT REPLACE(project_name, '-', '') AS project_name_no_dashes FROM projects;

-- Question 11: Create a label like “Emp: John Doe (HR)”
SELECT CONCAT('Emp: ', first_name, ' ', last_name, ' (', department_name, ')') AS label
FROM employees e JOIN departments d ON e.department_id = d.department_id;

-- Question 12: Check email length for each employee
SELECT first_name, last_name, email, LENGTH(email) AS email_length FROM employees;

-- Question 13: Extract last name only from email (before @)
SELECT email, SPLIT_PART(SPLIT_PART(email, '@', 1), '.', 2) AS last_name FROM employees;

-- Question 14: Format: “LASTNAME, Firstname” using UPPER and CONCAT
SELECT email, CONCAT(UPPER(SPLIT_PART(SPLIT_PART(email, '@', 1), '.', 2)), ', ', INITCAP(SPLIT_PART(SPLIT_PART(email, '@', 1), '.', 1))) AS formatted_name FROM employees;

-- Question 15: Add “(Active)” next to names who have current projects
SELECT first_name || ' ' || last_name || 
  CASE 
    WHEN p.end_date IS NULL OR p.end_date >= CURRENT_DATE THEN ' (Active)'
    ELSE ''
  END AS name_status
FROM employees e
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id
LEFT JOIN projects p ON ep.project_id = p.project_id;

-- Question 16: Round salary to the nearest whole number
SELECT employee_id, first_name, last_name, ROUND(salary) AS rounded_salary FROM employees;

-- Question 17: Show only even salaries using MOD
SELECT * FROM employees WHERE MOD(ROUND(salary), 2) = 0;

-- Question 18: Show difference between project end/start dates
SELECT project_id, end_date - start_date AS duration_days FROM projects;

-- Question 19: Absolute salary difference between two employees
SELECT ABS(e1.salary - e2.salary) AS salary_difference
FROM employees e1, employees e2
WHERE e1.employee_id = 101 AND e2.employee_id = 102;

-- Question 20: Raise salary by 10%
SELECT employee_id, salary AS original_salary, ROUND(salary * POWER(1.10, 1), 2) AS increased_salary FROM employees;

-- Question 21: Generate a random number for testing IDs
SELECT FLOOR(1000 + RANDOM() * 9000)::INT AS test_id;

-- Question 22: Use CEIL and FLOOR on a floating salary
SELECT employee_id, salary, CEIL(salary) AS ceil_salary, FLOOR(salary) AS floor_salary FROM employees;

-- Question 23: Use LENGTH() on phone numbers (assume column exists)
-- (Assuming phone_number column exists in employees)
SELECT employee_id, LENGTH(phone_number) AS phone_length FROM employees;

-- Question 24: Categorize salary: High/Medium/Low using CASE
SELECT employee_id, salary,
  CASE 
    WHEN salary >= 6000 THEN 'High'
    WHEN salary >= 4000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_category
FROM employees;

-- Question 25: Count digits in salary amount
SELECT employee_id, salary, LENGTH(CAST(salary AS TEXT)) AS digit_count FROM employees;

-- Question 26: Show today’s date
SELECT CURRENT_DATE AS today_date;

-- Question 27: Calculate how many days an employee has worked
SELECT employee_id, hire_date, CURRENT_DATE - hire_date AS days_worked FROM employees;

-- Question 28: Show employees hired in the current year
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = EXTRACT(YEAR FROM CURRENT_DATE);

-- Question 29: Display current date and time
SELECT NOW() AS current_datetime;

-- Question 30: Extract the year, month, and day from hire_date
SELECT employee_id, hire_date,
  EXTRACT(YEAR FROM hire_date) AS year,
  EXTRACT(MONTH FROM hire_date) AS month,
  EXTRACT(DAY FROM hire_date) AS day
FROM employees;

-- Question 31: Show employees hired before 2020
SELECT * FROM employees WHERE hire_date < '2020-01-01';

-- Question 32: List projects that ended in the last 30 days
SELECT * FROM projects
WHERE end_date BETWEEN CURRENT_DATE - INTERVAL '30 days' AND CURRENT_DATE;

-- Question 33: Calculate total days between project start and end
SELECT project_id, (end_date - start_date) AS total_days FROM projects;

-- Question 34: Format date: ‘2025-07-23’ to ‘July 23, 2025’
SELECT TO_CHAR(DATE '2025-07-23', 'Month DD, YYYY') AS formatted_date;

-- Question 35: CASE: if project still active (end_date IS NULL), show ‘Ongoing’
SELECT project_id, start_date,
  CASE
    WHEN end_date IS NULL THEN 'Ongoing'
    ELSE TO_CHAR(end_date, 'Month DD, YYYY')
  END AS project_status
FROM projects;

-- Question 36: Use CASE to label salaries
SELECT employee_id, salary,
  CASE 
    WHEN salary >= 7000 THEN 'High'
    WHEN salary >= 4000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_label
FROM employees;

-- Question 37: Use COALESCE to show ‘No Email’ if email is NULL
SELECT employee_id, COALESCE(email, 'No Email') AS email_address FROM employees;

-- Question 38: CASE: If hire_date < 2015, mark as ‘Veteran’
SELECT employee_id, hire_date,
  CASE 
    WHEN hire_date < '2015-01-01' THEN 'Veteran'
    ELSE 'Newcomer'
  END AS hire_status
FROM employees;

-- Question 39: If salary is NULL, default it to 3000 using COALESCE
SELECT employee_id, COALESCE(salary, 3000) AS salary_with_default FROM employees;

-- Question 40: CASE: Categorize departments (IT, HR, Other)
SELECT employee_id, department_id,
  CASE 
    WHEN department_id = 3 THEN 'IT'
    WHEN department_id = 1 THEN 'HR'
    ELSE 'Other'
  END AS dept_category
FROM employees;

-- Question 41: CASE: If employee has no project, mark as ‘Unassigned’
SELECT e.employee_id,
  CASE 
    WHEN ep.project_id IS NULL THEN 'Unassigned'
    ELSE 'Assigned'
  END AS project_status
FROM employees e
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id;

-- Question 42: CASE: Show tax band based on salary
SELECT employee_id, salary,
  CASE 
    WHEN salary >= 10000 THEN 'High Tax'
    WHEN salary >= 5000 THEN 'Medium Tax'
    ELSE 'Low Tax'
  END AS tax_band
FROM employees;

-- Question 43: Use nested CASE to label project duration
SELECT project_id, start_date, end_date,
  CASE 
    WHEN end_date IS NULL THEN 'Ongoing'
    ELSE 
      CASE 
        WHEN end_date - start_date >= 180 THEN 'Long-Term'
        WHEN end_date - start_date >= 90 THEN 'Medium-Term'
        ELSE 'Short-Term'
      END
  END AS duration_label
FROM projects;

-- Question 44: Use CASE with MOD to show even/odd employee IDs
SELECT employee_id,
  CASE 
    WHEN MOD(employee_id, 2) = 0 THEN 'Even'
    ELSE 'Odd'
  END AS id_type
FROM employees;

-- Question 45: Combine COALESCE + CONCAT for fallback names
SELECT employee_id,
  CONCAT(COALESCE(first_name, 'Unknown'), ' ', COALESCE(last_name, 'Employee')) AS full_name
FROM employees;

-- Question 46: CASE with LENGTH(): if name length > 10, label “Long Name”
SELECT employee_id, first_name,
  CASE 
    WHEN LENGTH(first_name) > 10 THEN 'Long Name'
    ELSE 'Short Name'
  END AS name_length_category
FROM employees;

-- Question 47: CASE + UPPER(): if email has ‘TEST’, mark as dummy account
SELECT email,
  CASE 
    WHEN UPPER(email) LIKE '%TEST%' THEN 'Dummy'
    ELSE 'Real'
  END AS email_type
FROM employees;

-- Question 48: Show seniority based on hire year
SELECT employee_id, hire_date,
  CASE 
    WHEN EXTRACT(YEAR FROM hire_date) >= 2020 THEN 'Junior'
    WHEN EXTRACT(YEAR FROM hire_date) BETWEEN 2015 AND 2019 THEN 'Mid-Level'
    ELSE 'Senior'
  END AS seniority_level
FROM employees;

-- Question 49: Use CASE to determine salary increment range
SELECT employee_id, salary,
  CASE 
    WHEN salary < 3000 THEN '10% Increment'
    WHEN salary BETWEEN 3000 AND 6000 THEN '7% Increment'
    WHEN salary BETWEEN 6001 AND 10000 THEN '5% Increment'
    ELSE '3% Increment'
  END AS increment_range
FROM employees;

-- Question 50: Use CASE with CURDATE() to determine anniversary month
SELECT employee_id, hire_date,
  CASE 
    WHEN EXTRACT(MONTH FROM hire_date) = EXTRACT(MONTH FROM CURRENT_DATE) THEN 'Anniversary Month'
    ELSE 'Not Anniversary'
  END AS anniversary_status
FROM employees;
