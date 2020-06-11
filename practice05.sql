1.문제

select first_name,
manager_id,
commission_pct,
salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

2.문제

select employee_id,
first_name,
salary,
to_char(hire_date,'yyyy-mm-dd day'),
replace(phone_number,'.','-'),
department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
from employees
group by department_id)
order by salary desc;

3.문제
18건

select e.manager_id,
e.first_name,
round(s.avgsalary,1),
s.minsalary,
s.maxsalary
from employees e, (select manager_id,
avg(salary) avgsalary,
min(salary) minsalary,
max(salary) maxsalary
from employees
group by manager_id
) s
where e.manager_id = s.manager_id;

4.문제

select e.employee_id, e.first_name, d.department_name, man.first_name
from employees e, departments d, employees man
where e.department_id = d.department_id(+)
and man.employee_id = d.manager_id;

5.문제
select w.rn,
w.employee_id,
w.first_name,
w.department_name,
w.salary,
w.hire_date
from(select rownum rn,
a.employee_id,
a.first_name,
a.department_name,
a.salary,
a.hire_date
from (select e.employee_id,
e.first_name,
d.department_name,
e.salary,
e.hire_date
from employees e, departments d
where e.department_id = d.department_id
order by hire_date asc) a)w
where rn >=11
and rn <=20;

6.문제

select
w.fullname "이름",
w.salary "연봉",
w.department_name "부서이름",
w.hire_date "입사일"
from(select rownum rn,
a.fullname,
a.salary,
a.department_name,
a.hire_date
from (
select e.first_name ||' ' || e.last_name fullname,
e.salary,
d.department_name,
e.hire_date
from employees e, departments d
where e.department_id = d.department_id
order by hire_date desc) a ) w
where rn<=1;


7.문제

select e.employee_id "사번",
e.first_name "이름",
e.last_name "성",
e.salary "급여",
avgsalary "평균급여",
j.job_title "업무"
from employees e, ( select department_id, round(avg(salary),1) avgsalary
from employees 
group by department_id
) d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
order by avgsalary desc;
 


8.문제
select
w.department_name
from (select rownum rn,
a.department_name
from (select d.department_name
from departments d, (select department_id, round(avg(salary),1) avgsalary
from employees
group by department_id)e
where d.department_id = e.department_id
order by avgsalary desc) a ) w
where rn <=1;

9.문제


select e.avgsalary,
r.region_name
from regions r,
countries c,
locations l,
departments d,
(select department_id, round(avg(salary),1) avgsalary
from employees
group by department_id ) e
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
;


select *
from *;

10.문제 

select
w.job_title
from (select rownum rn,
a.job_title
from (select job_title, avgsalary
from jobs j, (select job_id, avg(salary) avgsalary
from employees
group by job_id) e
where e.job_id = j.job_id
order by avgsalary desc) a) w
where rn <=1;


