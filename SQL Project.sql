Create database Vat;
Use Vat;
Create Table Department(
dept_id int primary key auto_increment,
dept_name varchar(70),
location varchar(80));

insert into Department (dept_id,dept_name,location) values
(10,"IT","New York"),
(20,"HR","Chicago"),
(30,"Sales","Los Angeles"),
(40,"Finance","Dallas");

Create Table Employee(
emp_id int primary key auto_increment,
emp_name varchar(70),
job varchar(80),
manager int,
hire_date date,
salary int,
dept_id int);

insert into Employee (emp_id,emp_name,job,manager,hire_date,salary,dept_id) values
(101,"Alice","Manager",NULL,"2018-05-10",90000,10),
(102,"Bob","Analyst",101,"2019-03-15",60000,20),
(103,"Charlie","Clerk",102,"2020-07-20",35000,20),
(104,"David","Analyst",101,"2018-11-25",62000,10),
(105,"Emma","Salesman",101,"2021-02-10",40000,30),
(106,"Frank","Analyst",104,"2022-01-05",58000,10),
(107,"Grace","Clerk",102,"2023-04-17",36000,20),
(108,"Henry","Salesman",105,"2021-09-30",42000,30);

Create Table Sale(
order_id int primary key auto_increment,
customer_id varchar(70),
amount int,
order_date date);

insert into Sale (order_id,customer_id,amount,order_date) values
(1001,"C001","500","2023-01-10"),
(1002,"C002","300","2023-01-15"),
(1003,"C001","450","2023-02-01"),
(1004,"C003","700","2023-02-18"),
(1005,"C002","200","2023-02-20"),
(1006,"C001","600","2023-03-05"),
(1007,"C004","800","2023-03-15");

Q1.
Update Employee set salary=65000    Where
where emp_id=102;
Select e.salary from Employee as e     Having
group by e.salary
having e.salary>35000;

Q2.
Select max(salary) from Employee;
Select max(salary) from Employee
where salary<(Select max(salary) from Employee);

Q3.
Select e.dept_id from Employee as e   INNER JOIN
inner join Department as d
on e.dept_id=d.dept_id;

Select e.dept_id  from Employee as e       LEFT JOIN
left join Department as d
on e.dept_id=d.dept_id;

Q4.
Select SUM(salary)
from Employee
Group By job;

Q5.
WITH Ranked_Employees AS(
SELECT emp_id,emp_name,salary,job,
ROW_NUMBER() OVER (PARTITION BY job order by salary DESC) AS rank_in_department
FROM Employee)
SELECT emp_id,emp_name,salary,job
from Ranked_Employees
where rank_in_department<=3;

Q6.
Select d.dept_id,d.dept_name
FROM department as d
LEFT JOIN employee as e ON d.dept_id=e.dept_id
Where e.emp_id IS NULL;

Q7.
Select salary
From (
select salary,
DENSE_RANK() OVER(ORDER BY salary desc) as salary_rank
From Employee) as ranked_salaries
where salary_rank = 5;

Q8.
Select emp_id, emp_name, hire_date from Employee
where hire_date> CURDATE() - INTERVAL 30 DAY;

Q9. 
Select e.emp_id,e.emp_name,e.job,e.manager,e.hire_date,e.salary,e.dept_id
FROM Employee as e
LEFT JOIN Department as d on e.dept_id=d.dept_id
Where d.dept_id IS NULL;

Q10.
SELECT e.emp_name AS Employee,
m.emp_name AS Manager From Employee e
JOIN Employee m ON e.manager= m.emp_id;













