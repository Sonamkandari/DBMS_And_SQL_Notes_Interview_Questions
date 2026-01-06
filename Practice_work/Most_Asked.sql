-- second highest salary
select max(salary) from Employee 
where salary<(select max(salary)from employee);

-- Another way of doing the same question
select (select distinct salary from employee 
order by salary desc limit 1 offset 1) as SecondHigestSalary;

-- Departmet Highest Salary
select d.name as Department,
e.name as Employee,
e.salary as Salary
from Employee e
join Department d
on e.departmentId=d.id
where e.salary=
  (select max(salary)from Employee 
  where departmentId=e.departmentId);

-- Duplicate Email
 select p.email as Email 
from Person p
group by email
having count(p.email)>1;

-- Employee Earning more than their Managers 
select e1.name as Employee from Employee e1
join Employee m2
on e1.managerId=m2.id
where e1.salary>m2.salary
-- Not Boring Movies
select id, movie, description, rating 
from Cinema 
where id%!=0 And description!='boring' order 
by rating desc;

-- Find Customer Referee

-- Customer Placing the largest Number of Orders 
select customer_number from Orders
group by customer_number
order by count(distinct order_number) desc limit 1

-- classes with at Leat 5 Students
select class from Courses 
group by class
having count(Student)>=5;

-- Monthly Transactions I


-- User activity from the last 30 days
select activity_date as day, count(distinct user_id) as active_users where
activity_date between date_sub('2019-07-27',interval 29 day) and '2019-07-27'
group by day

-- Students and Examinations 
