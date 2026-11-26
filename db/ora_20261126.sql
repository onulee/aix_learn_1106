-- 조인
select emp_name,department_id from employees;

select * from departments;

-- 
select * from board2;

select * from stuscore;
-- 학년,학반,전화번호,주소,보호자,담당교사,학교이름,성명,키,몸무게,특기
-- 학기,국어,영어,수학,합계,평균,등수

-- 조인의 필요성
-- 1. 중복된 데이터를 방지
-- 2. null값을 피하기 위해

-- 107*27
-- cross join : 테이블 연결
select * from employees,departments;

-- equi join : 공통적으로 존재하는 컬럼을 일치시켜서 연결
select department_id from employees;
select department_id from departments;

select * from employees,departments
where employees.department_id = departments.department_id;
-- equi join : 동일한 컬럼
select emp_name,employees.department_id,departments.department_name
, salary
from employees,departments
where employees.department_id = departments.department_id;

select * from departments;
select emp_name,department_id,salary from employees;
select count(*) from employees;
select count(*) from departments;


select emp_name,a.department_id,department_name
from employees a, departments b
where a.department_id = b.department_id
;

select job_id from employees;

select * from jobs;

-- equi join / employees, jobs
-- emp_name,salary,job_id,job_title,min_salary,max_salary,department_id
-- hire_date

select emp_name,salary,job_id,department_id,hire_date
from employees;

select job_id,job_title,min_salary,max_salary
from jobs;


select emp_name,salary,a.job_id
,job_title,min_salary,max_salary,department_id,hire_date
from employees a,jobs b
where a.job_id = b.job_id;

select * from member;

select * from stuscore;


drop table board;
drop table member;
drop table students;
drop table stuscore;
drop table stuscore2;

create table board (
bno number(4) primary key,
id varchar2(100),
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4) default 0,
bindent number(4) default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

create table member (
id varchar2(100) primary key,
pw varchar2(100),
name varchar2(100),
nickname varchar2(100),
tel char(13),
gender varchar2(100),
hobby varchar2(200),
mdate date default sysdate
);

drop table member;
drop table students;

create table students(
no number(4),
name varchar2(100) primary key,
major varchar2(100),
grade number(2),
age number(3),
gender varchar2(100),
hobby varchar2(200),
sdate date default sysdate
);

create table stuscore(
no number(4),
name varchar2(100),
school varchar2(100),
grade varchar2(2),
height number(4),
kor number(3),
eng number(3),
math number(3),
sw varchar2(100)
);

-- 외래키 등록
-- member primary key, board foreign key
alter table board add constraint board_member_fk_id foreign key(id)
references member(id) on delete set null;

select * from member;
select * from board;

select * from students;
select * from stuscore;
alter table stuscore add constraint stuscore_students_fk_name 
foreign key(name) 
references students(name) on delete cascade;

-- equi join name
select * from students;
select * from stuscore;

-- 성적을 출력하는데, 성별,나이를 같이 출력하고 싶음
select a.no,a.name,gender,age,kor,eng,math from stuscore a,students b
where a.name = b.name
;

--- 
select * from board;
select * from member;






