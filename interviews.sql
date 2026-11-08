DROP DATABASE IF EXISTS `interview_questions`;
CREATE DATABASE `interview_questions`;
USE `interview_questions`;

CREATE TABLE employees (							
  employee_id INT PRIMARY KEY,							
  first_name VARCHAR(50),								
  last_name VARCHAR(50),								
  hire_date DATE,										
  gender VARCHAR(10),									
  birth_date DATE,										
  manager_id INT NULL,									
   department_id INT,									
  FOREIGN KEY (department_id)							
	REFERENCES departments(department_id),				
  FOREIGN KEY (manager_id)
	REFERENCES employees(employee_id)
);												
												

CREATE TABLE salaries (
	salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL (10,2) NULL,
    FOREIGN KEY (employee_id)
		REFERENCES employees(employee_id));
        
CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    region VARCHAR(50));
    
CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    current_price DECIMAL (10,2));
    
CREATE TABLE Orders (
	Order_line_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,
    unit_price DECIMAL (10,2),
    region VARCHAR(50),
    FOREIGN KEY (product_id)
		REFERENCES products(product_id));
        
        
INSERT INTO departments VALUES
(1, 'Finance', 'Eastern Cape'),
(2, 'IT', 'Western Cape'),
(3, 'HR', 'Gauteng'),
(4, 'Sales', 'Eastern Cape');
    
select *
from departments;

INSERT INTO employees VALUES 
(1, 'Sarah', 'Mokuena', '2015-03-10', 'Female', '1985-04-12', NULL, 1), 
(2, 'John', 'Smoth','2018-06-15', 'Male','1990-08-21', 1, 1),
(3, 'Lisa','Brown', '2018-06-20', 'Female', '1992-01-05', 1, 1),
(4, 'Peter', 'Jones', '2017-02-01', 'Male', '1988-11-30', NULL, 2),
(5, 'Mary', 'Adams', '2020-02-12', 'Female', '1995-07-14', 4, 2),
(6, 'David', 'Khan', '2012-09-01', 'Male', '1982-09-03', Null, 3),
(7,	'Anna', 'Dube', '2022-05-01', 'Female','1998-12-25', 6, 3),
(8, 'James', 'Naidoo', '2019-05-15', 'Male', '1991-05-18', 1, 4),  
(9, 'Thandi', 'Ndlovu', '2021-08-01', 'Female', '1994-02-10', 8, 4),    
 (10, 'Mark', 'Williamns', '2016-10-01', 'Male', '1987-06-22', 4, 2);   
    
 select *
 from employees;
 
 INSERT INTO salaries VALUES
 (1, 1, 80000),
 (2, 2, 55000),
 (3, 3, 60000),
 (4, 4, 90000),
 (5, 5, 45000),
 (6, 6, 75000),
 (8, 8, 52000),
 (9, 9, 48000),
 (10, 10, null);
 
 SELECT *
 FROM salaries
 order by salary DESC;
 
 INSERT INTO products VALUES
	(101, 'Laptop', 12000),
    (102, 'Mouse', 250),
    (103, 'Keyboard', 500),
    (104, 'Monitor', 3000),
    (105, 'Printer', 2200),
    (106, 'Webcam', 800);
    
    select *
    from products
    order by current_price DESC;
    
    INSERT INTO Orders VALUES
    (1, 1001, 201, '2025-10-10', 101, 1, 12000, 'Eastern Cape'),
    (2, 101, 201, '2025-10-10', 102, 2, 250, 'Eastern Cape'),
    (3, 1002, 202, '2025-11-15', 103, 1, 500, 'Western Cape'),
    (4, 1003, 201, '2025-12-05', 104, 1, 3000, 'Eastern Cape'),
    (5, 1004, 203, '2026-01-12', 102, 3, 250, 'Gauteng'),
    (6, 1005, 201, '2026-02-18', 103, 2, 500, 'Eastern Cape'),
    (7, 1006, 202, '2026-03-20', 101, 1, 12000, 'Western Cape'),
    (8, 1006, 202, '2026-03-20', 104, 2, 3000, 'Western Cape'),
    (9, 1007, 201, '2026-04-10', 102, 1, 250, 'Eastern Cape'),
    (10, 1008, 203, '2026-05-22', 105, 1, 2200, 'Gauteng'),
    (11, 1009, 202, '2026-06-11', 103, 1, 500, 'Western Cape'),
    (12, 1010, 201, '2026-07-08', 101, 1, 12000, 'Eastern Cape'),
    (13, 1011, 204, '2026-08-14', 104, 1, 3000, 'Gauteng'),
    (14, 1012, 202, '2026-09-02', 102, 2, 250, 'Western Cape'),
    (15, 1013, 205, '2025-06-15', 105, 2, 2200, 'Gauteng');
    
    select *
    from orders
    order by order_date DESC;
    
  -- 2nd highest salary--
  
  select Max(salary) as second_highest_salary
  from salaries
  where salary < (select MAx(salary)
					from salaries);
                    
select *
from 
	(select *,
		dense_rank() over ( order by salary DESC) as sr
		from salaries) t
where sr = 2;
    
-- sharing the same manager--

select e.first_name, e.last_name, e.employee_id, m.manager_id, m.first_name as manager
from employees e
join employees m
	ON e.manager_id = m.employee_id
    order by manager;
    
-- 1st and last records based on hire date--

select * 
from (select *,
		row_number() over( order by hire_date ASC) as first_employee
        from employees) t
where first_employee = 1;

select *
from (select *,
		row_number() over (partition by employee_id
        order by hire_date ASC) as first_employee
        from employees) t
where first_employee = 1;

select *
from employees
order by hire_date ASC;

select *
from (select *,
		row_number() over(order by hire_date DESC) as last_employee
        from employees) t
where last_employee = 1;

select *
from (select *,
		row_number() over( order by hire_date ASC) as first_employee,
        row_number() over( order by hire_date DESC) as last_employee
        from employees) t
where first_employee = 1
or last_employee = 1
order by hire_date;
    
-- Recent transaction --

select *
from (select *,
		row_number() over ( order by order_date DESC) as latest_order
        from orders) t
where latest_order = 1;
    

-- total salary per department --

select d.department_name, sum(salary) as total_salary
from salaries s
join departments d
	ON s.employee_id = d.department_id
Group by department_name
having total_salary <= 60000;

-- running total --

select *, (quantity * unit_price) as product_revenue,
		sum(quantity * unit_price) over ( partition by customer_id
        order by order_date DESC) as running_total
from orders;


SELECT *,
(quantity * unit_price) AS product_revenue,
SUM(quantity * unit_price) OVER (
PARTITION BY customer_id
ORDER BY order_date DESC, order_line_id DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total
FROM orders;

-- Yearly & Monthly employees hired --

select Year(hire_date) as hire_year,
		Month(hire_date) as hire_month,
        count(*) AS Employees_hired
From employees
group by Year(hire_date), Month(hire_date)
Order by hire_year, hire_month;
    
    
-- earners above department average --

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    s.salary,
    d.department_name,
    da.avg_salary
FROM employees e
JOIN salaries s
    ON e.employee_id = s.employee_id
JOIN departments d
    ON e.department_id = d.department_id
JOIN (
    SELECT
        e.department_id,
        AVG(s.salary) AS avg_salary
    FROM employees e
    JOIN salaries s
        ON e.employee_id = s.employee_id
    GROUP BY e.department_id
) AS da
    ON e.department_id = da.department_id
WHERE s.salary > da.avg_salary;
    
 
 -- Minimum salary--
 
 SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    s.salary
FROM employees e
JOIN salaries s
    ON e.employee_id = s.employee_id
WHERE s.salary = (
    SELECT MIN(salary)
    FROM salaries
    WHERE salary > (
        SELECT MIN(salary)
        FROM salaries
    )
);
 
 
 
 
 






    
    
    
    
    
    
    
    
    
    
    
    