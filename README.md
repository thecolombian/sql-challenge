
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

   ![Query 1](path/to/query1_image.png)

2. **List the first name, last name, and hire date for the employees who were hired in 1986.**
   ![Query 2](path/to/query2_image.png)

3. **List the manager of each department along with their department number, department name, employee number, last name, and first name.**
   ![Query 3](path/to/query3_image.png)

4. **List the department number for each employee along with that employee’s employee number, last name, first name, and department name.**
   ![Query 4](path/to/query4_image.png)

5. **List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.**
   ![Query 5](path/to/query5_image.png)

6. **List each employee in the Sales department, including their employee number, last name, and first name.**
   ![Query 6](path/to/query6_image.png)

7. **List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.**
   ![Query 7](path/to/query7_image.png)

8. **List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).**
   ![Query 8](path/to/query8_image.png)
