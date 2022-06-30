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
SELECT * FROM account;

/*
게시글 테이블(게시글번호, 사용자 고유번호(외래키), 게시글 유형
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


/*
생태볼거리 테이블 (게시글번호(외래키), 사용자 고유번호(외래키), 월정보, (전시)관 정보, 대분류, 중분류, 소분류,
				학명, 국명, 분포, 내용, 이미지)
 */
CREATE TABLE ecog(
	postid number REFERENCES board(postid),
	accno number REFERENCES Account(accno),
	mm varchar2(5) CHECK(mm IN('1','2','3','4','5','6','7','8','9','10','11','12')),
	exspace varchar2(100),
	lcategory varchar2(50),
	mcategory varchar2(50),
	scategory varchar2(50),
	sname varchar2(100),
	kname varchar2(100),
	distribution varchar2(100),
	content varchar2(2000),
	imgurl varchar2(2000)	
);


/*
공모전캠페인 테이블(게시글번호(외래키), 사용자 고유번호(외래키),
	 제목, 사진(포스터), 링크, 내용, 시작일, 종료일)
 */
CREATE TABLE campaign(
	postid number REFERENCES board(postid),
	accno number REFERENCES Account(accno),
	title varchar2(200),
	poster varchar2(500),
	link varchar2(500),
	content varchar2(2000),
	sdate DATE,
	edate DATE	
);


/*

간행물 테이블(게시글번호(외래키), 사용자 고유번호(외래키), 분류, 제목, 작성일, 첨부파일, 내용)
 */
CREATE TABLE posting(
	postid number REFERENCES board(postid),
	accno number REFERENCES Account(accno),
	subtype varchar2(50),
	title varchar2(100),
	uploaddate DATE,
	pfile varchar2(100),
	content varchar2(2000)
);

-- ##샘플데이터 입력

-- 포토갤러리

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'길마가지나무',sysdate,
		'이른 봄에 하얀 꽃이 피며, 레몬과 비슷한 향기가 난다.

열매가 짐을 싣거나 수레를 끌기 위하여 소나 말 따위에 얹는 기구인

"길마"를 닮았다고 해서 길마가지나무라는 이름이 붙여졌다는 말도 있다.','https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000PuCHAIbMGgH6&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'산수유',sysdate,
		'매화와 함께 봄을 알리는 대표적인 꽃이다.

꽃을 자세히 보면 하나의 꽃망울에

여러 개의 작은 꽃들이 모여 있어 작은 부케처럼 보인다.',	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_0005MCFcU1g28qa&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'노루귀',sysdate,
		'꽃이 지고 나오는 잎 모양이 마치 노루의 귀처럼 동그랗게 말리고

잎 뒷면에 털이 나서 노루귀라는 이름이 붙여졌다.

흰색, 분홍색 꽃을 피우고 제주도를 제외한 한반도 전역에 분포한다.',	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000qo5gr1zFKzHb&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'히어리',to_date('2019-03-22','YYYY-MM-DD'),
		'히어리는 식물분류학상 조록나무목(Hamamelidales), 조록나무과(Hamamelidaceae), 히어리속(Corylopsis)의 여러해살이식물이다. 지리산을 중심으로 전남지역에서 주로 관찰되며 경기도(포천)와 강원도(강릉) 일부지역에서도 자생한다.',
		'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000lX958w0KmGwE&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'큰고니 가족',to_date('2019-02-27','YYYY-MM-DD'),
		'국립생태원 내 용화실 못에 찾아온 큰고니 가족

큰 고니는 환경부 지정 야생동물 멸종위기 Ⅱ급이자 천연기념물 201-2호로 보호받고 있습니다.',
		'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_0002rA61nXi8DTD&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'착생란',to_date('2019-01-15','YYYY-MM-DD'),
		'실제 자연에서 자라는 모습처럼 연출된 착생란',
		'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000Ltwf4C0f5V6s&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'산양과 노루',to_date('2018-11-14','YYYY-MM-DD'),
		'산양과 노루',
		'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000vQ1Ger29n50D&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'먹황새',to_date('2018-10-23','YYYY-MM-DD'),
		'먹황새는 몸이 전체적으로 광택이 있는 검은색으로 신비로운 느낌이 들며,

주로 농경지, 강 하구, 저수지, 하천, 풀이 우거진 습지에서 살고 먹이로는 어류나 양서·파충류를 잡아먹는다.',
		'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000an6aex62cd6b&fileSn=1');

INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'사구식물원',to_date('2018-10-18','YYYY-MM-DD'),
		'모래땅 위의 식물들. 사구식물원을 소개합니다.',
		'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000VNto2mn0cmD2&fileSn=1');


INSERT INTO board values(brd_seq.nextval ,1,'포토갤러리');

INSERT INTO photog values(brd_seq.currval,1,'플루메리아 루브라',to_date('2018-07-06','YYYY-MM-DD'),
		'플루메리아 루브라는 가지를 자르면 고무액 같은 수액이 나오는데 독성이 있습니다.

꽃은 향기가 짙고, 꽃잎은 5개로 프로펠라 모양처럼 되어 있습니다.',
		'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_00044lE6G9hC380&fileSn=1');



-- # 간행물

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'국립생태원 브로슈어(2021)',to_date('2022-03-04','YYYY-MM-DD'),'국립생태원_2021브로슈어(국문).pdf','국립생태원 브로슈어(2021)');

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'2022년 국립생태원 달력 무료드림',to_date('2021-12-22','YYYY-MM-DD'),'2022년 국립생태원 달력_PC&모바일용.zip','멸종위기종 동식물의 일러스트로 만든 2022년 국립생태원 달력!');

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'국립생태원 읽기 쉬운 안내문',to_date('2020-04-28','YYYY-MM-DD'),'국립생태원 읽기 쉬운 안내.pdf','국립생태원에서는 쉬운 정보를 필요로 하는 분들을 위해

기관 소개 정보, 관람 ?이용 정보 등을 쉬운 글과 그림으로 구성한

"읽기 쉬운 안내문"을 개발하였습니다.

');

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'국립생태원 리플릿(2019)',to_date('2019-08-06','YYYY-MM-DD'),'국립생태원 리플릿(2019).pdf','국립생태원 리플릿입니다.');

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'국립생태원 브로슈어(2018)',to_date('2018-07-04','YYYY-MM-DD'),'국립생태원_2018브로슈어.pdf','국립생태원 브로슈어(2018)');

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'2018 국립생태원 통합관광지도',to_date('2018-07-04','YYYY-MM-DD'),'2018국립생태원 통합관광지도.pdf','2018 국립생태원 통합관광지도');

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'서천∙군산∙전주 안내 책자(전주)',to_date('2017-07-25','YYYY-MM-DD'),'0719_지도책자(최종).pdf','생태관광의 명소 서천 근대역사 문화를 품은 군산 가장 한국적인 도시 전주 각자의 개성이 넘치는 세개의 도시를 한번에 만나보세요!');

INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'활동지 안내',to_date('2017-05-31','YYYY-MM-DD'),'국립생태원_고학년(초등)_리플릿.pdf','국립생태원에서는 재미와 배움이 있는 다양한 체험 거리를 통해
    생태계의 가치와 아름다움을 알 수 있도록 활동지를 개발하였습니다.');

   INSERT INTO board values(brd_seq.nextval ,1,'간행물');

INSERT INTO posting values(brd_seq.currval,1,'생태연구',
		'활동지 안내',to_date('2017-05-31','YYYY-MM-DD'),'국립생태원_고학년(초등)_리플릿.pdf','국립생태원에서는 재미와 배움이 있는 다양한 체험 거리를 통해
    생태계의 가치와 아름다움을 알 수 있도록 활동지를 개발하였습니다.');

-- 생태볼거리

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'1','에코리움(열대관)',
				'식물군','온실식물','열대식물','Dendrobium',
				'덴드로비움','-',
			'난 애호가들이 주로 재배하는 대표적인 서양란으로 알려져있다. 재배시에는 화분에 이끼, 수태, 펄라이트, 침엽수의 수피 등을 넣어 심어두지만, 자생지에서는 바위, 나무 위로 뿌리가 기어가며 착생한다.
높이는 50cm정도로 자라고, 식물체 크기에 비해 파스텔톤의 꽃 크기가 큰 편이다.',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000330&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'1','에코리움(열대관)',
				'식물군','온실식물','열대식물','Rhaphidophora cryptantha',
				'라피도포라','-',
			'열대우림에 서식하는 상록성 덩굴로 2m까지 자란다. 줄기는 직사각형이다. 잎이 아름다워서 Rhaphidophora속 식물 대부분이 관상용으로 많이 이용된다.',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000276&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'1','에코리움(사막관)',
				'식물군','온실식물','사막식물','Aloe',
				'알로에','-',
			'알로에는 알로에속(屬) 식물을 통칭하는 이름이다.
그 중 우리나라에서 유용식물로 활용하여 많이 알려진 알로에는 알로에 베라(Aloe vera), 알로에 아보레센스(Aloe arborescens),사포나리아(Aloe maculata) 등이다.',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000331&fileSn=3');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'1','에코리움(지중해관)',
				'식물군','온실식물','지중해식물','Dombeya wallichii',
				'돔베야 왈리키이','-',
			'열대 및 아열대 기후에서 잘 자라며, 온대지역에서는 대부분 실내에서 재배된다.
화서는 잎겨드랑이에 달리며 아래를 본다.
원산지에서는 7월부터 꽃이 피고 있다고 보고되었으나,
관상용으로 재배하는 것은 가을에서 이른 봄까지 개화하는 것으로 알려져 있다.',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000225&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'1','에코리움(온대관)',
				'식물군','온실식물','온대식물','Common camellia',
				'동백나무','-',
			'상록활엽교목으로 수고 12m, 흉고직경 50㎝이상 자란다. 잎은 어긋나며 타원형 또는 긴 타원형으로 끝이 점점 뾰족하고 가장자리에 물결 모양의 잔잔한 톱니가 있다. 잎 앞면은 짙은 녹색이며 광택이 나고 뒷면은 황록색이다. 수피는 회백색이고 어린가지는 갈색이다. 꽃은 화경이 없고 반정도 벌어지며 12~3월까지 가지 끝 또는 잎겨드랑이에 1개씩 핀다.',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000094&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'2','에코리움(열대관)',
				'식물군','온실식물','열대식물','Erythrina amazonica',
				'아마존산호나무','-',
			'아마존산호나무는 열대 중남미(브라질, 페루, 콜롬비아)가 원산으로 꽃의 색깔은 밝은 핑크색이고 줄기는 불규칙하게 많은 가시가 있으며 최대 12m까지 자라는 낙엽성 아교목이다.',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000333&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'2','에코리움(지중해관)',
				'식물군','온실식물','지중해식물','Acacia floribunda',
				'아카치아 플로리분다','-',
			'높이 6m까지 자라는 관목 혹은 소교목으로 호주의 동쪽에서 자생한다.
엽상체는 선형에서 좁은 타원형으로 길이 10cm이다.
꽃은 이른 봄에 피고 길이 4cm 정도의 크림색 화서에 달린다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000227&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'2','에코리움(온대관)',
				'식물군','온실식물','온대식물','Daphne kiusiana',
				'백서향나무','-',
			'제주도, 거제도 등 우리나라의 남쪽 섬과 일본에 분포하는 상록성 관목.
높이 1m 정도 자라며 가지가 많이 갈라진다.
잎은 어긋나며, 양면에 털이 없고 끝이 뾰족하다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000222&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'3','에코리움(사막관)',
				'식물군','온실식물','온대식물','Ferocactus',
				'페로칵투스','-',
			'미국 남서부지방, 멕시코에 자라는 다년생 다육식물이다.
줄기는 기둥형이거나 둥근형으로 수직 능선이 있으며, 두껍고 튼튼한 가시가 특징이다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000285&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'3','에코리움(지중해관)',
				'식물군','온실식물','지중해식물','Weeping bottlebrush',
				'칼리스테몬 비미날리스','-',
			'관목이나 작은 나무로 8m까지 자라지만, 야생에서는 10m까지 자란다. 나무 껍질은 어둡고 주름져 있다. 가지가 일반적으로 늘어져 있다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000238&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'4','에코리움(사막관)',
				'식물군','온실식물','사막식물','Elephant Cactus',
				'무륜주선인장','-',
			'얼핏 사와로 선인장(Carnegiea gigantea)과 비슷하게 생겼지만, 서리나 추운 날씨에 상대적으로 약하고 해가 진 뒤에 꽃을 피우며, 색상이 더 푸르스름하고 가지가 더 많다. 사와로 선인장보다 아래쪽에 달리는 가지가 많으며 자라는 속도도 훨씬 빠르다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000074&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'4','에코리움(지중해관)',
				'식물군','온실식물','지중해식물','Strelitzia reginae',
				'극락조화','-',
			'얼핏 사와로 선인장(Carnegiea gigantea)과 비슷하게 생겼지만, 서리나 추운 날씨에 상대적으로 약하고 해가 진 뒤에 꽃을 피우며, 색상이 더 푸르스름하고 가지가 더 많다. 사와로 선인장보다 아래쪽에 달리는 가지가 많으며 자라는 속도도 훨씬 빠르다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000192&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'4','에코리움(열대관)',
				'식물군','온실식물','열대식물','Scadoxus multiflorus',
				'파이어볼릴리','-',
			'상록수의 다년생 식물로 최대 9 개의 잎을 만들어 내며 잎 기부는 줄기처럼 보이며, 지름 25mm정도로 튼튼하고 다육질이며 보통 자주색 점이 있다. 잎은 뚜렷한 주맥이 있다. 산형화서는 최대 200개의 꽃으로 구성되며, 둥근 구형으로 지름 25cm이다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000246&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'5','야외(한반도숲)',
				'식물군','야외식물','야외식물','Dicentra spectabilis',
				'금낭화','-',
			'제주도를 제외한 전역 산속, 계곡주변에 나는 여러해살이풀로 높이는 50-70cm이다. 잎은 2-3깃꼴로 갈라지는 우상복엽(깃꼴겹잎)이다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000281&fileSn=2');

INSERT INTO board values(brd_seq.nextval,1,'생태볼거리');

INSERT INTO ecog values(brd_seq.currval,1,'6','야외(수생식물원)',
				'식물군','야외식물','수생식물','Nymphoides peltata',
				'노랑어리연','-',
			'중부이남 습지, 연못 등 얕은 물에서 자라는 부엽식물로서 여러해살이풀이다.
땅속줄기는 물 속 뻘에서 길게 뻗으며, 줄기는 길게 자라 여러갈래로 갈라진다.
',
	'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=TBNATURE00000291&fileSn=2');

-- 공모전 캠페인

INSERT INTO board values(brd_seq.nextval,1,'공모전캠페인');

INSERT INTO campaign values(brd_seq.currval,1,'제7회 국립생태원 생태문학 공모전',
			'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=cb14ed6224054113919482d62cd50ba6&fileSn=1',
			'www.nie-contest.com','문     의 : 전화번호 02-6953-1310 / 이메일 nie@contestweb.net'
			,to_date('2022-06-07','YYYY-MM-DD'),to_date('2022-08-31','YYYY-MM-DD'));

INSERT INTO board values(brd_seq.nextval,1,'공모전캠페인');

INSERT INTO campaign values(brd_seq.currval,1,'제4회 멸종위기야생생물 상상그림 및 상상뉴스 공모전',
			'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000c335s0AMwcMq&fileSn=1',
			'www.spectory.net/nie/encontest/2022/1','수상작 발표 : 3월 24일 예정 *홈페이지 게시 및 개별 통보'
			,to_date('2022-02-03','YYYY-MM-DD'),to_date('2022-03-11','YYYY-MM-DD'));


INSERT INTO board values(brd_seq.nextval,1,'공모전캠페인');

INSERT INTO campaign values(brd_seq.currval,1,'재활용품 수집노인 환경개선 아이디어 공모전',
			'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_000u0EA9hv4H8GG&fileSn=1',
			'www.nieidea.com/','   1. 재활용품 수집노인에 대한 명칭

   2. 쓰레기 재활용에 대한 표어

   3. 재활용품 수집노인이 사용할 손수레 제작 아이디어'
			,to_date('2021-11-05','YYYY-MM-DD'),to_date('2021-11-28','YYYY-MM-DD'));

INSERT INTO board values(brd_seq.nextval,1,'공모전캠페인');

INSERT INTO campaign values(brd_seq.currval,1,'2021년 람사르습지도시 홍보 영상콘텐츠 공모전',
			'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_00069N7zEBS288J&fileSn=1',
			'blog.naver.com/wetlandkorea/222561684452','- 출품수량 : 개인 또는 단체(팀)별 1작품에 한함'
			,to_date('2021-09-13','YYYY-MM-DD'),to_date('2021-10-31','YYYY-MM-DD'));

INSERT INTO board values(brd_seq.nextval,1,'공모전캠페인');

INSERT INTO campaign values(brd_seq.currval,1,'제 2회 에코뱅크 기능 및 생물·생태 빅데이터 활용 경진대회',
			'https://www.nie.re.kr/cmmn/file/imageSrc.do?atchFileId=MFILE_0004Q27E7seXrXs&fileSn=1',
			'spectory.net/nie/ecobank/','온라인 발표 심사 : 11월 18일(목)(예정)'
			,to_date('2021-09-06','YYYY-MM-DD'),to_date('2021-11-05','YYYY-MM-DD'));
------------------------------------------------------------------------------------------


/*프로그램 정보 테이블*/
create table Programs(
	pname varchar2(50) primary key,
	category varchar2(50),
	target varchar2(50),
	days varchar2(50),
	capacity number,
	span1 DATE,
	span2 DATE,
	ptime varchar2(100),
	loc varchar2(50),
	contents varchar2(100)
);

INSERT INTO Programs values('개미탐험전','생태해설','단체/개인','매일',20,to_date('2022-04-26','YYYY-MM-DD'),to_date('2022-07-31','YYYY-MM-DD'),
'10:00~10:30','에코리움 내 생태해설 Q&A','지구의 숨은 지배자, 개미');
INSERT INTO Programs values('5대 기후대관 속 탄소중립 이야기','생태해설','단체/개인','매일',20,to_date('2022-05-20','YYYY-MM-DD'),to_date('2022-07-31','YYYY-MM-DD'),
'11:00~12:00','에코리움 내 생태해설 Q&A','세계 여러 생태계 속 탄소중립적 요소 살펴보기');
INSERT INTO Programs values('탄소빼기 초록더하기','생태교육','단체','월요일',1,to_date('2022-05-26','YYYY-MM-DD'),to_date('2022-07-25','YYYY-MM-DD'),
'11:00~11:40','온라인 교육','내 생활 속 탄소빼기 생각해보고 실천해요');

CREATE SEQUENCE rezid_seq
       INCREMENT BY 1
       START WITH 20220001
       MINVALUE 20220001
       MAXVALUE 99999999
       NOCYCLE;

/*예약 테이블*/
CREATE TABLE REZ(
	rezid NUMBER PRIMARY key,
	rezdate varchar2(100),
	pname varchar2(50) REFERENCES Programs(pname),
	name varchar2(50),
	email varchar2(100),
	phone varchar2(100),
	pay varchar2(50)
);

INSERT INTO rez values(rezid_seq.nextval, '2022-07-01', '개미탐험전', '홍길동','hongildong@email.com','010-1234-5678','현장결제');