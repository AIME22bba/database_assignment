Names:Hagenimana Aime De dieu
Id:28039
Group:E

# SQL Function Exercises – Assignment

##  Description

This project is a collection of SQL queries solving 50 exercises based on:
- String Functions
- Numeric Functions
- Date/Time Functions
- Conditional Logic

The exercises use a case study with the following tables:
- `employees`
- `departments`
- `projects`
- `employee_projects`

The goal is to practice and demonstrate SQL functions in a real-world employee-project scenario.

---

## 📁 File

- **`database_work.sql`**  
  Contains all 50 SQL queries organized by category. Each query is numbered according to the question.

---

## 📂 Query Sections

### 1️⃣ String Function Exercises (1–15)
- Examples: concatenation, lowercase, substring, email modification, formatting.

### 2️⃣ Numeric Function Exercises (16–25)
- Examples: rounding, modulus, salary difference, power function, salary categorization.

### 3️⃣ Date/Time Function Exercises (26–35)
- Examples: current date, hire duration, extract parts of date, ongoing project check.

### 4️⃣ Conditional Function Exercises (36–50)
- Examples: CASE statements for categorization, COALESCE usage, seniority, increment bands.

---

## Sample Queries

```sql
-- 1. Concatenate first and last name
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- 18. Calculate project duration in days
SELECT project_id, end_date - start_date AS duration_days FROM projects;

-- 36. Label salaries
SELECT employee_id, salary,
  CASE 
    WHEN salary >= 7000 THEN 'High'
    WHEN salary >= 4000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_label
FROM employees;
