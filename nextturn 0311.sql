DROP SEQUENCE seq_pdt;
CREATE SEQUENCE seq_pdt
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;

--��ǰ ���̺�
DROP TABLE tbl_pdt;
CREATE TABLE tbl_pdt(
    pno NUMBER PRIMARY KEY, --��Ϲ�ȣ
    pname VARCHAR2(500) NOT NULL,  --�����̸�
    ptype VARCHAR2(200) NOT NULL,  -- �帣
    pmemo VARCHAR2(1000),  -- �ΰ�����
    p_img VARCHAR2(300),  -- �����̸�
    plevel NUMBER DEFAULT 0,  -- ���̵�
    p_star NUMBER DEFAULT 0, -- ����
    regdate DATE DEFAULT SYSDATE  --�ֱ� ������¥
);
SELECT * FROM tbl_pdt;

--Ÿ�̴�Ÿ�� �ַ��Ͼ� īź ���� ����ġũ���� ���
INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'Ÿ�̴�Ÿ��','����','�޸��','gm001.jpg',5,7.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'�ַ��Ͼ�','�ʱ�����','�޸��','gm002.jpg',3,8.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'īź','��������','�޸��','gm003.jpg',2,3.4);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'����','�ʱ�����','�޸��','gm004.jpg',5,6.6);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'����ġũ��ĵ','����','�޸��','gm005.jpg',8,5.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'������','ī�����','�޸��','gm006.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'������','ī�����','�޸��','gm007.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'������','ī�����','�޸��','gm008.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'������','ī�����','�޸��','gm009.jpg',7,3.3);

INSERT INTO tbl_pdt(pno,pname,ptype,pmemo,p_img,plevel,p_star)
VALUES(seq_pdt.NEXTVAL,'������','ī�����','�޸��','gm009.jpg',7,3.3);
--=========================================================================================
-- ȸ�� ���̺�
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