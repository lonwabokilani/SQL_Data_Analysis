# SQL_Data_Analysis

**Overview**

End-to-end MySQL project to show practical analysis using related database tables. Namely, Employee, salary, department, product and order data. The tables created are followed by queries that answer business questions and analysis.

This portfolio project is made for entry-level **Data Analyst**, **Juniour SQL Analyst**, and **Business Analyst**. The queries in the project are used to examine and analyse sales, workforce information, salaries and patterns in the business.

**The Business questions examined**

The syntax and examples in this project cover the following:

                             
| **Field**                  | **Analysis** | 
|--|--|                            
|1. Salary analysis          | Find the second highest salary                           |                          
|2. Employee structure       | Explore the employee and manager relationship            |                         
|3. Hiring analysis          | Find records for the first and last hired employees      |                          
|4. Transaction analysis     | Identify the most recent transaction                     |                        
|5. Department analysis      | Aggregate salary by department                           |                         
|6. Sales analysis           | Find running totals                                      |                         
|7. Compensation benchmarking| Identify employees earning above their department average|                         
|8. Salary distribution      | Find the second lowest salary                            |   

**Database Structure**
|Table | Purpose | Columns |
|---|---|---|
|1. Employees | Employee details | Employee_id, Names, Hire_date, Manager_id, and Department_id|
|2. Salaries | Employee salaries | Salary_id, Employee_id, and Salary |
|3. Departments | Department information | Department_id, Department_name, and Region |
|4. Products | Product catalogue and prices | Product_id, Product_name, and current prices |
|5. Orders | Order-line transactions | Order-line_id, Order_id, Customer_id, Order_date, Product_id, Quantity, Unit price, and Region |

**SQL skills**


1. CREATE DATABASE, CREATE TABLE, primary keys, and foreign keys.
2. INSERT INTO, SELECT, WHERE, and ORDER BY.
3. JOINS
4. SUBQUERIES and AGGREGATED FUNCTIONS.
5. GROUP BY and HAVING
6. WINDOW FUNCTIONS: ROW_NUMBER(), DENSE_RANK()
7. DATE FUNCTIONS: YEAR() and MONTH()

**Respository structure**


sql-data-analysis/

├── README.md

└── sql/

    └── interviews.sql


**How to run the project**
1. Install **MySQL 8.0** or later version and open MySQL workbench.
2. Download or clone this respository.
3. Open sql/interviews.sql.
4. Execute the database setup and data insertion statements, then run the analysis queries.
5. Inspect the results and compare them with business questions above.

Author
Lonwabo Kilani
Aspiring Data Analyst| SQL | Excel | Power BI 






   








 
