create table stuscore (
    no number(4),
    name varchar2(50),
    school varchar2(100),
    rank number(1),
    height number(4,1),
    kor number(4,1),
    eng number(4,1),
    math number(4,1),
    total number(4,1),
    avg number(5,2),
    specialty varchar2(50)
);


select * from stuscore;

-- 순차정렬
select * from stuscore
order by height asc;

-- 역순정렬
select name,height,eng,kor from stuscore
order by height desc,eng asc,kor desc;

select * from stuscore;

-- 이름 순으로 역순정렬
select name from stuscore
order by name desc;

-- 학교순으로 순차정렬, rank 역순정렬
select school,rank from stuscore
order by school asc, rank desc;

--employees테이블에서 입사일 기준으로 순차정렬(오름차순) 을 하고
-- 출력은 사원번호, 사원명, 직급, 입사일 칼럼을 출력하시오.
select employee_id,emp_name,job_id,hire_date from employees
order by hire_date asc;

desc employees;

-- 사원번호, 부서, 입사일을 출력하되
-- 정렬 부서는 순차정렬, 입사일 역순정렬 하시오.
select employee_id,department_id,hire_date from employees
order by department_id asc,hire_date desc;

-- dual 임시테이블(가상테이블)
select -1 from dual;
select (-1*3+100-100) from dual;

-- abs : 절대값출력
select abs(-123) from dual;
-- round : 반올림 round(값,자리수)
select round(12.34567,2) from dual;

select kor,eng,math,kor+eng+math total,(kor+eng+math)/3 avg from stuscore;

-- 평균을 소수점 2자리에서 반올림해서 출력하시오.

















