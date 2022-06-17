/*
cmd창 실행
sqlplus
system/1111
CREATE USER p04 IDENTIFIED BY 1111;
grant dba to p04;
*/

CREATE TABLE Account(
	accno NUMBER PRIMARY KEY,
	name varchar2(50) NOT NULL,
	id varchar2(15) NOT NULL UNIQUE,
	pw varchar2(20) NOT NULL,
	birthday DATE NOT NULL,
	mnum varchar2(14) NOT NULL, -- 휴대폰 번호
	pnum varchar2(14),			-- 집전화 번호
	email varchar2(30) NOT NULL,
	address varchar2(60) NOT NULL,
	regdate DATE NOT NULL,
	admin NUMBER NOT NULL -- 0 일반회원, 1 관리자
);

CREATE SEQUENCE acc_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE;

INSERT INTO Account VALUES(
acc_seq.nextval, '우주인', 'asdasd123', '123123',
TO_DATE('19980513','YYYYMMDD'),'010-5126-4634',NULL,
'asdasd123@naver.com','경기도 수원시 권선구 권선동 1357',sysdate,1
);
INSERT INTO Account VALUES(
acc_seq.nextval, '지구인', 'dsadsa123', '123123',
TO_DATE('19980513','YYYYMMDD'),'010-5126-4634',NULL,
'asdasd123@naver.com','경기도 수원시 권선구 세류2동 1159-4',sysdate,0
);
INSERT INTO Account VALUES(
acc_seq.nextval, '화성인', 'aaaabbbb123', '321321',
TO_DATE('19980513','YYYYMMDD'),'010-5126-4634',NULL,
'asdasd123@naver.com','경기도 성남시 중원구 성남동 3128',sysdate,0
);



/*
게시글 테이블(게시글번호(기본키), 사용자 고유번호(외래키), 게시글 유형
 */
CREATE TABLE board(
	postid number PRIMARY KEY,
	accno number REFERENCES Account(accno),
	ptype varchar2(50) check(ptype IN('포토갤러리','생태볼거리','공모전캠페인','간행물'))
);

CREATE SEQUENCE brd_seq
       INCREMENT BY 1
       START WITH 10000000
       MINVALUE 10000000
       MAXVALUE 99999999
       NOCYCLE;

SELECT * FROM board;




/*
포토갤러리 테이블(게시글번호(외래키), 사용자 고유번호(외래키), 제목, 작성일, 내용, 이미지

 */

CREATE TABLE photog(
	postid number REFERENCES board(postid),
	accno number REFERENCES Account(accno),
	title varchar2(100),
	uploaddate DATE,
	content varchar2(2000),
	imgurl varchar2(2000)
);

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');
INSERT INTO photog values(10000000,1,'제목입니다.',sysdate,'내용입니다.. 내용입니다.','img01.jpeg');
SELECT * FROM photog;

/*
생태볼거리 테이블 (게시글번호(외래키), 사용자 고유번호(외래키), 월정보, (전시)관 정보, 대분류, 중분류, 소분류,
				학명, 국명, 분포, 내용, 이미지)
 */
CREATE TABLE ecog(
	postid number REFERENCES board(postid),
	accno number REFERENCES Account(accno),
	mm varchar2(2) CHECK(mm IN('1','2','3','4','5','6','7','8','9','10','11','12')),
	exspace varchar2(50),
	lcategory varchar2(50),
	mcategory varchar2(50),
	scategory varchar2(50),
	sname varchar2(100),
	kname varchar2(100),
	distribution varchar2(100),
	content varchar2(2000),
	imgurl varchar2(2000)	
);


INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');
INSERT INTO ecog values(10000001,1,'6','에코리움(열대관)','식물군','온실식물','열대식물','Cirinum Americanum','아메리카 문주란',NULL,'내용..@@@','img02.jpeg');
SELECT * FROM ecog;

/*
공모전캠페인 테이블(게시글번호(외래키), 사용자 고유번호(외래키), 제목, 사진(포스터), 링크, 내용, 시작일, 종료일)
 */
CREATE TABLE campaign(
	postid number REFERENCES board(postid),
	accno number REFERENCES Account(accno),
	title varchar2(50),
	poster varchar2(50),
	link varchar2(500),
	content varchar2(2000),
	sdate DATE,
	edate DATE	
);

INSERT INTO board values(brd_seq.nextval,1,'공모전캠페인');
INSERT INTO campaign values(10000002,1,'제목입니다','img03.jpeg','www.test.test','내용입니다.',sysdate-10,sysdate+10);
SELECT * FROM campaign;

/*
간행물 테이블(게시글번호(외래키), 사용자 고유번호(외래키), 분류, 제목, 작성일, 첨부파일, 내용)
 */
CREATE TABLE posting(
	postid number REFERENCES board(postid),
	accno number REFERENCES Account(accno),
	subtype varchar2(50),
	title varchar2(50),
	uploaddate DATE,
	pfile varchar2(50),
	content varchar2(2000)
);

INSERT INTO board values(brd_seq.nextval,1,'간행물');
INSERT INTO posting values(10000003,1,'생태연구','제목입니다.',sysdate,'file.pdf','내용입니다..');
SELECT * FROM posting;

SELECT * FROM board;

