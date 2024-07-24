
# Module 9 Challenge

For this project, I'll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. In other words, I'll be performing data modeling, data engineering, and data analysis.

# Employee Database Challenge

This challenge is divided into three parts: data modeling, data engineering, and data analysis.

## First Task: Entity Relationship Diagram (ERD)

- Sketch an Entity Relationship Diagram of the tables.
- ![ERD](EmployeeSQL/images/ERD_entity_relationship_diagram_SQL_2024-07-22_22-58-57.png)

## Second Task: Table Schema Creation

- Create a table schema for each of the six CSV files.
- SQL to create the database and the tables.
- Specify the data types, primary keys, foreign keys, and other constraints.
- [Create SQL DB & Tables](EmployeeSQL/SQL_create_statements/SQL_Create_all_tables.sql)
  

### SQL File Location
The SQL file to create the database and tables can be found at:


## Third Task: Data Analysis

### Queries and Results

1. **List the employee number, last name, first name, sex, and salary of each employee.**
```
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;
```

   ![Query 1](EmployeeSQL/images/List_the_employee_number_last_name_first_name_sex_and_salary_of_each_employee.png)

2. **List the first name, last name, and hire date for the employees who were hired in 1986.**
```
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
```
   ![Query 2](EmployeeSQL/images/List_the_first_name_last_name_and_hire_date_for_the_employees_who_were_hired_in_1986.png)

3. **List the manager of each department along with their department number, department name, employee number, last name, and first name.**

```
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;
```
   ![Query 3](EmployeeSQL/images/List_the_manager_of_each_department_along_with_their_department_number_department_name_employee_number_last_name_and_first_name.png)

4. **List the department number for each employee along with that employee’s employee number, last name, first name, and department name.**
```
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;
```
   ![Query 4](EmployeeSQL/images/List_the_department_number_for_each_employee_along_with_that_employee’s_employee_number_last_name_first_name_and_department_name.png)

5. **List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.**
```
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
```
   ![Query 5](EmployeeSQL/images/List_first_name_last_name_and_sex_of_each_employee_whose_first_name_is_Hercules_and_whose_last_name_begins_with_the_letter_B.png)

6. **List each employee in the Sales department, including their employee number, last name, and first name.**
```
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
```
   ![Query 6](EmployeeSQL/images/List_each_employee_in_the_Sales_and_Development_departments_including_their_employee_number_last_name_first_name_and_department_name.png)

7. **List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.**
```
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');
```
   ![Query 7](EmployeeSQL/images/List_each_employee_in_the_Sales_and_Development_departments_including_their_employee_number_last_name_first_name_and_department_name.png)

8. **List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).**
```
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
```
   ![Query 8](EmployeeSQL/images/List_the_frequency_counts_in_descending_order_of_all_the_employee_last_names_that_is_how_many_employees_share_each_last_name.png)
