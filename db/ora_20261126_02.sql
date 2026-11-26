select * from employees;

create table event (
eno number(4) primary key,
etitle varchar2(1000),
econtent clob,
efile varchar2(100)
);

insert into event values(
event_seq.nextval,'이벤트제목','내용입니다.','1.jpg'
);
commit;


-- 파일여러개 저장

-- equi join : 같은 컬럼을 가지고 2개의 테이블에서 검색
-- non-equi join : 같은 컬럼이 없지만 2개의 테이블에서 검색
-- self join : 자신의 테이블 2번 호출해서 검색

-- null값이 있는 것은 출력에서 제외
select a.employee_id,a.emp_name,a.job_id,a.salary,a.manager_id,b.emp_name
from employees a,employees b
where a.manager_id = b.employee_id
order by employee_id;

-- 그룹함수 null값을 제외
select count(*),count(manager_id) from employees;

-- inner join
-- out join
select a.employee_id,a.emp_name,a.manager_id,b.emp_name
from employees a, employees b
where a.manager_id = b.employee_id(+);

select emp_name,manager_id from employees
where manager_id is null;




-- departments,employees 테이블에서
-- employees테이블에서 없는 부서번호,부서명도 출력하시오.
-- equi join emp_name,department_id,department_name

select emp_name,b.department_id,department_name
from employees a,departments b
where a.department_id(+) = b.department_id
and emp_name is null
;

select * from departments;


select emp_name,a.department_id
from employees a, departments b
where a.department_id = b.department_id;

-- ansi join
select emp_name,department_id
from employees inner join departments
using (department_id);




-- ansi outer join (left)
select a.emp_name,a.manager_id,b.employee_id
from employees a left outer join employees b 
on a.manager_id = b.employee_id ;

-- equi join : outer join
select emp_name,a.department_id,department_name
from employees a, departments b
where a.department_id = b.department_id(+);
-- ansi left join
select emp_name,a.department_id,department_name
from employees a left outer join departments b
on a.department_id = b.department_id;



-- equi join : outer join
select emp_name,a.department_id,department_name
from employees a, departments b
where a.department_id(+) = b.department_id(+);
-- ansi right join
select emp_name,a.department_id,department_name
from employees a full outer join departments b
on a.department_id = b.department_id;

select * from employees;

create or replace view view_employees
as
select employee_id,emp_name,phone_number from employees
;


select * from view_employees;

select * from stuscore;
select * from students;

create or replace view v_stu
(
name,school,grade,kor,eng,math,total,avg
)as
select a.name,school,grade,kor,eng,math,kor+eng+math total,avg
from stuscore a,students b
where a.name = b.name;

select * from v_stu;







