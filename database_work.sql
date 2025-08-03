1.SELECT concat(first_name,'',last_name) as full_name from employees;
2.SELECT 
  LOWER(first_name || ' ' || last_name) AS full_name_lowercase
FROM employees;
3.SELECT 
  LEFT(first_name, 3) AS first_three_letters
FROM employees;
4.SELECT 
  REPLACE(email, '@company.com', '@org.com') AS updated_email
FROM employees;
5.SELECT TRIM('   John Doe   ') AS trimmed_string;
6.SELECT 
  LENGTH(first_name || ' ' || last_name) AS full_name_length
FROM employees;
7.SELECT 
  POSITION('@' IN email) AS at_position
FROM employees;
8.SELECT concat('Mr.',first_name)from employee;
9.SELECT 
  UPPER(project_name) AS project_name_upper
FROM projects;
10.SELECT 
  REPLACE(project_name, '-', '') AS project_name_no_dashes
FROM projects;

11.select concat('EMP:',first_name,last_name,' ',mid(project_name,1,2))from employee e join employee_projects ep on e.employee_id=ep.employee_id join projects p on ep.project_id = p.project_id;

12.SELECT 
  first_name,
  last_name,
  email,
  LENGTH(email) AS email_length
FROM employees;
13.SELECT  email, split_part(split_part(email, '@', 1), '.', 2) AS last_namSELECT 
14.SELECT 
  email, 
  CONCAT(
    UPPER(split_part(split_part(email, '@', 1), '.', 2)), 
    ', ', 
    INITCAP(split_part(split_part(email, '@', 1), '.', 1))
  ) AS formatted_name
FROM employees;
15.
16.SELECT 
  employee_id,
  first_name,
  last_name,
  email,
  ROUND(salary) AS rounded_salary
FROM employees;
17.SELECT 
  employee_id,
  first_name,
  last_name,
  email,
  salary
FROM employees
WHERE MOD(ROUND(salary), 2) = 0;
18.SELECT 
  project_id,
  end_date - start_date AS duration_days
FROM projects;
19.SELECT 
  ABS(e1.salary - e2.salary) AS salary_difference
FROM employees e1
JOIN employees e2 ON 1=1
WHERE e1.employee_id = 101
  AND e2.employee_id = 102;
20.SELECT 
  employee_id,
  first_name,
  last_name,
  salary AS original_salary,
  ROUND(salary * POWER(1.10, 1), 2) AS increased_salary
FROM employees;
21.SELECT FLOOR(1000 + RANDOM() * 9000)::INT AS test_id;
22.SELECT 
  employee_id,
  first_name,
  last_name,
  salary,
  CEIL(salary) AS salary_ceiled,
  FLOOR(salary) AS salary_floored
FROM employees;
23.SELECT column_name
FROM information_schema.columns
WHERE table_name = 'employees';
24.SELECT 
  employee_id,
  first_name,
  last_name,
  salary,
  CASE 
    WHEN salary >= 6000 THEN 'High'
    WHEN salary >= 4000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_category
FROM employees;
25.SELECT 
  employee_id,
  salary,
  LENGTH(CAST(salary AS TEXT)) AS digit_count
FROM employees;
26.SELECT CURRENT_DATE AS today_date;
27.SELECT 
  employee_id,
  first_name,
  last_name,
  hire_date,
  CURRENT_DATE AS today,
  CURRENT_DATE - hire_date AS days_worked
FROM 
  employees;
28.SELECT 
  employee_id,
  first_name,
  last_name,
  hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = EXTRACT(YEAR FROM CURRENT_DATE);
29.SELECT NOW() AS current_datetime;
30.SELECT 
  employee_id,
  hire_date,
  EXTRACT(YEAR FROM hire_date) AS hire_year,
  EXTRACT(MONTH FROM hire_date) AS hire_month,
  EXTRACT(DAY FROM hire_date) AS hire_day
FROM employees;
31.SELECT 
  employee_id,
  first_name,
  last_name,
  hire_date
FROM employees
WHERE hire_date < '2020-01-01';
32.SELECT *
FROM projects
WHERE end_date BETWEEN CURRENT_DATE - INTERVAL '30 days' AND CURRENT_DATE;
33.SELECT 
  project_id,
  start_date,
  end_date,
  (end_date - start_date)::INTEGER AS total_days
FROM projects;
34.SELECT 
  CONCAT(
    TO_CHAR(DATE '2025-07-23', 'Month'), ' ',
    EXTRACT(DAY FROM DATE '2025-07-23'), ', ',
    EXTRACT(YEAR FROM DATE '2025-07-23')
  ) AS formatted_date;
35.SELECT
  project_id,
  start_date,
  CASE
    WHEN end_date IS NULL THEN 'Ongoing'
    ELSE CONCAT(
      TRIM(TO_CHAR(end_date, 'Month')), ' ',
      EXTRACT(DAY FROM end_date), ', ',
      EXTRACT(YEAR FROM end_date)
    )
  END AS project_status
FROM projects;
36.SELECT
  employee_id,
  salary,
  CASE
    WHEN salary >= 7000 THEN 'High'
    WHEN salary >= 4000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_label
FROM employees;
37.SELECT
  employee_id,
  COALESCE(email, 'No Email') AS email_address
FROM employees;
38.SELECT
  employee_id,
  first_name,
  last_name,
  hire_date,
  CASE
    WHEN hire_date < DATE '2015-01-01' THEN 'Veteran'
    ELSE 'Newcomer'
  END AS hire_status
FROM employees;
SELECT
  employee_id,
  first_name,
  last_name,
  COALESCE(salary, 3000) AS salary_with_default
FROM employees;
39.SELECT 
  employee_id,
  first_name,
  last_name,
  COALESCE(salary, 3000) AS salary
FROM employees;
40.SELECT
  employee_id,
  department_id,
  CASE
    WHEN department_id = 1 THEN 'IT'
    WHEN department_id = 2 THEN 'HR'
    ELSE 'Other'
  END AS department_category
FROM employees;
41.SELECT column_name
FROM information_schema.columns
WHERE table_name = 'projects';
42.SELECT 
  employee_id,
  first_name,
  last_name,
  salary,
  CASE
    WHEN salary >= 10000 THEN 'High Tax Band'
    WHEN salary >= 5000 THEN 'Medium Tax Band'
    WHEN salary > 0 THEN 'Low Tax Band'
    ELSE 'No Salary'
  END AS tax_band
FROM employees;
43.SELECT 
  project_id,
  project_name,
  start_date,
  end_date,
  CASE 
    WHEN end_date IS NULL THEN 'Ongoing'
    ELSE 
      CASE 
        WHEN end_date - start_date >= 180 THEN 'Long-Term'
        WHEN end_date - start_date >= 90 THEN 'Medium-Term'
        WHEN end_date - start_date >= 0 THEN 'Short-Term'
        ELSE 'Invalid Dates'
      END
  END AS duration_label
FROM projects;
44.SELECT 
  employee_id,
  salary,
  CASE 
    WHEN MOD(employee_id, 2) = 0 THEN 'Even'
    ELSE 'Odd'
  END AS id_parity
FROM employees;
45.SELECT 
  employee_id,
  CONCAT(
    COALESCE(first_name, 'Unknown'),
    ' ',
    COALESCE(last_name, 'Employee')
  ) AS full_name
FROM employees;
46.SELECT 
  employee_id,
  first_name,
  CASE 
    WHEN LENGTH(first_name) > 10 THEN 'Long Name'
    ELSE 'Short Name'
  END AS name_length_category
FROM employees;
47.SELECT 
  employee_id,
  email,
  CASE 
    WHEN UPPER(email) LIKE '%TEST%' THEN 'Dummy Account'
    ELSE 'Real Account'
  END AS email_type
FROM employees;
48.SELECT 
  employee_id,
  hire_date,
  CASE 
    WHEN EXTRACT(YEAR FROM hire_date) >= 2020 THEN 'Junior'
    WHEN EXTRACT(YEAR FROM hire_date) BETWEEN 2015 AND 2019 THEN 'Mid-Level'
    ELSE 'Senior'
  END AS seniority_level
FROM employees;
49.SELECT 
  employee_id,
  salary,
  CASE 
    WHEN salary < 3000 THEN 'Increment: 10%'
    WHEN salary BETWEEN 3000 AND 6000 THEN 'Increment: 7%'
    WHEN salary BETWEEN 6001 AND 10000 THEN 'Increment: 5%'
    ELSE 'Increment: 3%'
  END AS increment_range
FROM employees;
50.SELECT 
  employee_id,
  first_name,
  hire_date,
  CASE 
    WHEN EXTRACT(MONTH FROM hire_date) = EXTRACT(MONTH FROM CURRENT_DATE) 
         THEN 'Anniversary Month'
    ELSE 'Not Anniversary Month'
  END AS anniversary_status
FROM employees;
51.SELECT column_name
FROM information_schema.columns
WHERE table_name = 'your_table';