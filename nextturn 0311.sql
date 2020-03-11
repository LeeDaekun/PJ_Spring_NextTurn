DROP SEQUENCE seq_pdt;
CREATE SEQUENCE seq_pdt
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;

--상품 테이블
DROP TABLE tbl_pdt;
CREATE TABLE tbl_pdt(
    pno NUMBER PRIMARY KEY, --등록번호
    pname VARCHAR2(500) NOT NULL,  --게임이름
    ptype VARCHAR2(200) NOT NULL,  -- 장르
    pmemo VARCHAR2(1000),  -- 부가설명
    p_img VARCHAR2(300),  -- 사진이름
    plevel NUMBER DEFAULT 0,  -- 난이도
    p_star NUMBER DEFAULT 0, -- 평점
    regdate DATE DEFAULT SYSDATE  --최근 수정날짜
);
SELECT * FROM tbl_pdt;

--타이니타운 솔레니아 카탄 퀸즈 노터치크라켄 등록
INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'타이니타운','전략','메모란','gm001.jpg',5,7.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'솔레니아','초급전략','메모란','gm002.jpg',3,8.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'카탄','가족게임','메모란','gm003.jpg',2,3.4);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'퀸즈','초급전략','메모란','gm004.jpg',5,6.6);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'노터치크라캔','블러핑','메모란','gm005.jpg',8,5.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'윙스팬','카드놓기','메모란','gm006.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'윙스팬','카드놓기','메모란','gm007.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'윙스팬','카드놓기','메모란','gm008.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'윙스팬','카드놓기','메모란','gm009.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'윙스팬','카드놓기','메모란','gm009.jpg',7,3.3);
--=========================================================================================
-- 회원 테이블
DROP TABLE tbl_member;
CREATE TABLE tbl_member(
    id VARCHAR2(100) PRIMARY KEY,
    pw VARCHAR2(200) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    postcode VARCHAR2(30) NOT NULL,
    addr1 VARCHAR2(300) NOT NULL,
    addr2 VARCHAR2(300) NOT NULL,
    useon VARCHAR2(20) NOT NULL,
    primaryon VARCHAR2(20) NOT NULL,
    locon VARCHAR2(20) DEFAULT 'false',
    eventon VARCHAR2(20) DEFAULT 'false',
    useyn VARCHAR2(200) DEFAULT 'n',
    regdate DATE DEFAULT SYSDATE,
   	birth NUMBER(8) DEFAULT 00000000,
	male VARCHAR2(10) DEFAULT 'null'
);
SELECT * FROM tbl_member;
SELECT COUNT(*) FROM tbl_member 
		WHERE id = 'kenisia';

commit;