DROP TABLE SCHEDULE_TABLE;

CREATE TABLE SCHEDULE_TABLE(
	U_NO NUMBER PRIMARY KEY,
	S_DATE DATE NOT NULL,
	S_TIME NUMBER NOT NULL,
	S_LOCATION VARCHAR2(1000) NOT NULL,
	S_COURSE VARCHAR2(1000) NOT NULL,
	S_PEOPLE NUMBER NOT NULL,
	S_PRICE VARCHAR2(100) NOT NULL,
	S_REGDATE DATE NOT NULL,
	S_LATITUDE VARCHAR2(1000) NOT NULL,
	S_LONGITUDE VARCHAR2(1000) NOT NULL,
	CONSTRAINT FK_USER FOREIGN KEY(U_NO) REFERENCES USER_TABLE(U_NO)
);

SELECT * FROM SCHEDULE_TABLE;

INSERT INTO SCHEDULE_TABLE VALUES(4,TO_DATE('2018-12-24','YYYY-MM-DD') ,'8','제주도','동백습지 -> 한라산 -> 우도 -> 샤려니숲길',2,'100,000',SYSDATE,36.12345677,123.23124155);

INSERT INTO SCHEDULE_TABLE VALUES(2,'사용자가 설정한날넣기','사용자가 설정한시간','선택한지역넣기','설정한코스',2,SYSDATE);

DELETE FROM SCHEDULE_TABLE;