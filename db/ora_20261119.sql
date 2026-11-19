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
-- round(값,자리수)
select round((kor+eng+math)/3,2) from stuscore;
-- 버림:floor
select floor((kor+eng+math)/3) from stuscore;
-- 올림:ceil
select ceil((kor+eng+math)/3) from stuscore;

-- trunc 버림(특정자리수 버림)
select (kor+eng+math)/3,trunc((kor+eng+math)/3,3) from stuscore;


-- 나머지
select mod(3,2) from dual;

select kor,round(kor,-1),trunc(kor,-1) from stuscore;


-- 1915,1819,1719
-- 1900,1800,1700 
-- dual 사용
select trunc(1915,-2) from dual;

-- 사원번호 홀수인 사원을 출력하시오.
-- 역순정렬로 출력하시오.

select employee_id from employees
where mod(employee_id,2)=1
order by employee_id desc
;

-- stuscore 평균값이 80점 이상인 학생을 출력하시오.
select kor,eng,math,(kor+eng+math) total,(kor+eng+math)/3 avg from stuscore
where (kor+eng+math)/3 >=80
order by (kor+eng+math)/3 desc
;

-- stuscore no 짝수인 학생을 출력하시오.
select * from stuscore
where mod(no,10)=0;

select * from stuscore;

select * from board;

-- 시퀀스 : 번호가 자동으로 증가, 1씩 증가
select board_seq.nextval from dual;

select board_seq.currval from dual;


-- 테이블복사와 데이터 복사를 함께 실행
create table stuscore2 as select * from stuscore;
-- 테이블구조만 복사 
create table stuscore3 as select * from stuscore where 1=2;

select * from stuscore3;

insert into stuscore3 values(
board_seq.nextval,'홍길동','신림고',1,190,100,100,99,(100+100+99),
(100+100+99)/3,'python'
);

select * from stuscore3;
delete stuscore3;
commit;

-- stuscore2_seq시퀀스를 새롭게 생성, 101 부터 시작
-- stuscore2 홍길동 학생성적을 입력해보세요.

select * from stuscore2;
insert into stuscore2 values(
stuscore2_seq.nextval,'홍길동','신림고',1,180,100,100,99,229,(229/3),'python'
);

commit;


select board_seq.nextval from dual;
select stuscore2_seq.currval from dual;

create sequence board2_seq
increment by 1
start with 1
minvalue 1
maxvalue 9999
nocycle
nocache;


-- sql기본 select,insert,update,delete
-- 게시판리스트 : select   select * from stuscore
-- 게시글입력 : insert     insert into stuscore values (    )
-- 게시글수정 : update     update stuscore set name = '홍길자' where no=1
-- 게시글삭제 : delete     delete stuscore where no=1

select * from stuscore2;
select board_seq.currval from dual;
-- 101
insert into stuscore2 values(
 stuscore2_seq.nextval, '유관순','신림고',1,170,90,90,91,271,271/3,'c'
);

select * from stuscore2;
delete stuscore2 where no=37;

update stuscore2 set name = '유관자' where no=102;

select * from board2;

-- board 그대로 구조,데이터 모두 복사해서 board2
-- 시퀀스 board2 생성해서 시작 101부터
-- 1개의 게시글을 입력해서 출력하시오.
create table board2 as select * from board;


select * from board2;
insert into board2 values(
board2_seq.nextval,'aaa','게시글제목','게시글 내용입니다.',
board2_seq.currval,0,0,0,sysdate,''
);

commit;



















