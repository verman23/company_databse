create database org;
show databases;
use org;
CREATE table worker(
worker_id int NOT NULL PRIMARY KEY auto_increment,
First_name varchar(25),
Last_name varchar(25),
salary int(15),
joining_date datetime,
department char(25)
);
show table status;
select* from worker;
iNSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);
select * from Bonus;
INSERT INTO Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
INSERT INTO Title 
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

--  Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as<WORKER_NAME>
select First_name AS worker_name from worker;

-- Q-2.Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case and lower case.
select upper(first_name) from worker;
select lower(first_name) from worker;

-- Q-3.Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;
-- using group by query
select department from worker group by department;

-- Q-4.Write an SQL query to print the first three characters of FIRST_NAME from Worker table
select substring(first_name,1,3) from worker;

-- Q-5.. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Vishal’ from Worker table.
select instr(first_name,'a') from worker where first_name='vishal';

-- Q-6.Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces 
-- from the right side && left side
select rtrim(first_name) from worker;
select ltrim(first_name) from worker;

-- Q-7. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and 
-- prints its length
select distinct department,length(department) from worker;

-- Q-8. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'a','V') from worker; 

-- Q-9. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a 
 -- single column COMPLETE_NAME.
select CONCAT(first_name, ' ', last_name) AS COMPLETE_NAME from worker;

-- Q-10.Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
-- Ascending & Descending order
select * from worker order by first_name;
select * from worker order by first_name desc; -- here desc == descending
desc worker; -- here desc == describe

-- Q-11.Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” 
-- from Worker table.
select * from worker where first_name IN('vipul','satish');

-- Q-12. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”
select * from worker where department =('admin');
select * from worker where department like'admin';

-- Q-13. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
 select * from worker where first_name like'%a';

-- Q-14. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
-- contains six alphabets
select * from worker where first_name like'_____h';-- start
select * from worker where first_name like'v_____';-- end

-- Q-15. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000
select * from worker where salary between 100000 and 500000;

-- Q-16. Write an SQL query to print details of the Workers who have joined in Feb’2014
select * from worker where year(JOINING_DATE)=2014 and month(JOINING_DATE)=02;

-- Q-17. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select department, count(*) from worker where department = 'Admin';

-- Q-18 Write an SQL query to fetch worker full names with salaries >= 50000 and <= 10000
select concat(first_name,'',last_name) as salary_data from worker where salary between 50000 and 100000;

-- Q-19 Write an SQL query to fetch the no. of workers for each department in the descending order.
select department,count(worker_id) as no_of_worker from worker group by department 
order by no_of_worker; -- ascending order
select department,count(worker_id) as no_of_worker from worker group by department 
order by no_of_worker desc; -- descending order

-- Q-20. Write an SQL query to print details of the Workers who are also Managers.
select w.* from worker as w inner join title as t on w.worker_id=t.worker_ref_id
where t.worker_title='Manager';

-- Q-21.Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select worker_title,count(*) as count from title group by worker_title having count>1;

-- Q-22. Write an SQL query to show only odd & even rows from a table.
select * from worker where MOD(worker_id,2)!=0;-- odd
select * from worker where MOD(worker_id,2)<>0;-- odd
select * from worker where MOD(worker_id,2)=0; -- even

-- Q-23.Write an SQL query to clone a new table from another table.
create table worker_clone like worker;
insert into worker_clone select * from worker;
select * from worker_clone;

-- Q-24.Write an SQL query to fetch intersecting records of two tables
select worker.* from worker inner join worker_clone using (worker_id);

-- Q-25.Write an SQL query to show the current date and time 
select curdate();
select now();

-- Q-26. Write an SQL query to show the top n (say 5) records of a table order by descending salary
select * from worker order by salary desc limit 5;

-- Q-27. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker order by salary desc limit 4,1; -- limit n-1,1

-- Q-28. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select salary from worker W1
where 4=(
select count(distinct(w2.salary))
from worker w2
where w2.salary>=w1.salary
);

-- Q-29. Write an SQL query to fetch the list of employees with the same salary.
select w1.* from worker  w1,worker w2
where w1.salary = w2.salary and w1.worker_id!=w2.worker_id;
select * from worker ;

-- Q-30. Write an SQL query to show the second highest salary from a table using sub-query
select max(salary) from worker; -- for highest salary
-- second highest salary 
select max(salary) from worker where salary not in (select max(salary) from worker);

-- Q-31. Write an SQL query to show one row twice in results from a table
-- to show the data one entry  2 times 
select * from worker
union all
select * from worker order by worker_id;

-- Q-32. write an SQL query to list worker_id who does not get bonus
select worker_id,first_name,last_name from worker where worker_id not in (select worker_ref_id from bonus);

-- Q-33. Write an SQL query to fetch the first 50% records from a table
select * from worker where worker_id<=(select count(worker_id)/2 from worker);

-- Q-34. Write an SQL query to fetch the departments that have less than 4 people in it
select department,count(*) as dpcount from worker group by department having dpcount>=4; 

-- Q-35. Write an SQL query to show all departments along with the number of people in there
select department,count(*) as dpcount from worker group by department;

-- Q-36.  Write an SQL query to show the  record from a table
-- last record
select * from worker order by worker_id desc limit 0,1;
select * from worker where worker_id = (select max(worker_id) from worker);
-- first record 
select * from worker order by worker_id asc limit 0,1;
select * from worker where worker_id=(select min(worker_id) from worker);
-- nth record
select * from worker order by worker_id asc limit 4,1; 

-- Q-37.Write an SQL query to print the name of employees having the highest salary in each department
select w.department,w.first_name,w.last_name,w.salary from (select max(salary) as maxsal,
department from worker group by department) temp
inner join worker w on temp.department=w.department and temp.maxsal=w.salary;
select department ,max(salary) from worker group by department;
select department,first_name,last_name,max(salary) from worker group by department,first_name,last_name;

-- Q-38.Write an SQL query to fetch the names of workers who earn the highest salary. and lowest salary
select first_name,last_name,salary from worker where salary=(select max(salary) from worker);
select first_name,last_name,salary from worker where salary=(select min(salary) from worker);

-- Q-39.Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department ,sum(salary) as dpsum from worker group by department order by dpsum desc;

-- Q-40 . Write an SQL query to fetch nth max salaries from a table.
select distinct salary from worker w1
where n >= (select count(distinct salary) from worker w2 where w1.salary <= w2.salary) order by 
w1.salary desc;
