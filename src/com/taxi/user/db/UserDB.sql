DROP TABLE USER_TABLE;
DROP SEQUENCE U_NO_SEQ;

CREATE SEQUENCE U_NO_SEQ;

CREATE TABLE USER_TABLE(
	U_NO NUMBER NOT NULL,
	U_NAME VARCHAR2(100) NOT NULL,
	U_ID VARCHAR2(100) NOT NULL,
	U_PW VARCHAR2(100) NOT NULL,
	U_BIRTH VARCHAR2(6) NOT NULL,
	U_GENDER VARCHAR2(2) NOT NULL,
	U_PHONE VARCHAR2(100) NOT NULL,
	U_EMAIL VARCHAR2(100) NOT NULL,
	U_ENABLED VARCHAR2(2) NOT NULL,
	U_ROLE VARCHAR2(50) NOT NULL,
	
	CONSTRAINT USER_TABLE_PK PRIMARY KEY(U_NO),
	CONSTRAINT USER_TABLE_UQ_U_ID UNIQUE(U_ID),
	CONSTRAINT USER_TABLE_U_GENDER_CHK CHECK(U_GENDER IN ('M','W')),
	CONSTRAINT USER_TABLE_UQ_U_PHONE UNIQUE(U_PHONE),
	CONSTRAINT USER_TABLE_UQ_U_EMAIL UNIQUE(U_EMAIL),
	CONSTRAINT USER_TABLE_U_ROLE_CHK CHECK(U_ROLE IN ('ADMIN','USER','DRIVER')),
	CONSTRAINT USER_TABLE_U_ENABLED_CHK CHECK(U_ENABLED IN ('Y','N'))
);

INSERT INTO USER_TABLE
VALUES(U_NO_SEQ.NEXTVAL,'박병길','test','test','890521','M','010-1234-1234','test@gmail.com','USER','Y');

SELECT * FROM USER_TABLE;

