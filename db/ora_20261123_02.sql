select * from mem;

select * from screen;

select * from mem;
alter table mem drop constraint SYS_C008394; 
alter table mem add constraint mem_pk_id primary key(id);


-- foreign key 등록하려면, 
-- 우선 다른테이블에서 primary key 등록이 되어 있어야 가능
select * from board;


select * from mem;


select bno from board2
order by bno;

-- 1-20 :id-aaa
-- 21-40: bbb, 41-60:ccc , 61-80:ddd, 81-100:eee
-- 변경하시오.
update board set id='eee' 
where bno between 81 and 100;
commit;
select * from board order by bno;

-- foreign key 변경설정
alter table board 
add constraint board_fk_id foreign key(id)
references mem(id)
;

select * from board;

insert into board values(
101,'abc','게시글 제목','게시글내용',101,0,0,0,sysdate,''
);

select * from board2;

create table member2 as select * from member;


drop table member2;

drop table mem;





