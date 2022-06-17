CREATE TABLE Account(
	accno NUMBER PRIMARY KEY,
	name varchar2(50),
	id varchar2(15),
	pw varchar2(20),
	birthday DATE,
	regdate DATE,
	mnum varchar2(14),
	pnum varchar2(14),
	email varchar2(30),
	address varchar2(60),
	admin NUMBER
);