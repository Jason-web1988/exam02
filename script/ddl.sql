select user from dual;
drop table board_tbl_01;


create table board_tbl_01(
	idx number(6) not null primary key,
	writer varchar2(20),
	subject varchar2(255),
	content clob,
	regDate timestamp
);

create table comment_tbl_01(
	idx number(6) not null primary key,
	bidx number(6),
	writer varchar2(20),
	content clob,
	regDate timestamp
);

--시퀀스 생성
create sequence board_seq01
start with 1
increment by 1
minvalue 1;

create sequence comment_seq01
start with 1
increment by 1
minvalue 1;

insert into board_tbl_01 values(board_seq01.nextval, '김회원', '정보처리 산업기사 쉽다', 'jsp쉽네요', '2018-07-31 12:34:56');
insert into board_tbl_01 values(board_seq01.nextval, '김회원', '웹 디자인 기능사 어렵다', 'jquery 어렵네요', '2018-07-31 12:43:43');
insert into board_tbl_01 values(board_seq01.nextval, '이회원', '정보처리 산업기사 어렵다', 'jsp 어렵네요', '2018-08-01 13:34:56');
insert into board_tbl_01 values(board_seq01.nextval, '이회원', '정보처리 산업기사 쉽다', 'jquery 쉽네요', '2018-08-01 13:43:34');
insert into board_tbl_01 values(board_seq01.nextval, '박회원', 'ㅈㄱㄴ', '제목 그대로 내용', '2018-08-02 13:12:10');
insert into board_tbl_01 values(board_seq01.nextval, '박회원', '제목 그대로 내용', 'ㅈㄱㄴ', '2018-08-03 14:56:30');
insert into board_tbl_01 values(board_seq01.nextval, '강회원', '하드코딩하는 사람들', '가입하면 좋음', '2018-08-04 14:56:30');
insert into board_tbl_01 values(board_seq01.nextval, '나회원', 'github를 사용합시다.', '신세계', '2018-08-05 15:43:35');
insert into board_tbl_01 values(board_seq01.nextval, '문회원', '노는게 제일좋아', '모두들 모여라', '2018-08-06 16:21:40');
insert into board_tbl_01 values(board_seq01.nextval, '지회원', '여름아', '부탁해', '2018-08-07 17:01:45');


insert into comment_tbl_01 values(comment_seq01.nextval, 1 , '김회원', 'Lorem ipsum dolor sit amet', '2018-08-01 12:34:56');
insert into comment_tbl_01 values(comment_seq01.nextval, 3 , '김회원', 'consectetur adipiscing elit', '2018-08-01 12:43:43');
insert into comment_tbl_01 values(comment_seq01.nextval, 5 , '이회원', 'sed do eiusmod tempor', '2018-08-02 12:34:56');
insert into comment_tbl_01 values(comment_seq01.nextval, 7 , '이회원', 'incididunt ut labore et', '2018-08-03 13:43:34');
insert into comment_tbl_01 values(comment_seq01.nextval, 9 , '박회원', 'dolore magna aliqua', '2018-08-04 13:12:10');
insert into comment_tbl_01 values(comment_seq01.nextval, 2 , '박회원', 'minim veniam, quis nostrud', '2018-08-04 14:34:20');
insert into comment_tbl_01 values(comment_seq01.nextval, 3 , '강회원', 'exeritation ullamco laboris', '2018-08-05 14:56:30');
insert into comment_tbl_01 values(comment_seq01.nextval, 5 , '나회원', 'nisi ut aliquip', '2018-08-06 15:43:35');
insert into comment_tbl_01 values(comment_seq01.nextval, 7 , '문회원', 'ex ea commodo consequat', '2018-08-07 16:21:40');
insert into comment_tbl_01 values(comment_seq01.nextval, 2 , '지회원', 'Duis aute irure dolor', '2018-08-01 17:01:45');

select idx, writer, subject, content, regdate from board_tbl_01 order by idx desc;
select idx, writer, subject, content, regdate from board_tbl_01 where idx=1;

select * from comment_tbl_01;
select idx, bidx, writer, content, regdate from comment_tbl_01;
select idx, bidx, writer, content, regdate from comment_tbl_01 where bidx=2;
select count(*) from board_tbl_01;

delete COMMENT_TBL_01 where bidx=20;