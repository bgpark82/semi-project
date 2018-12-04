DROP TABLE SCHEDULE_TABLE;

CREATE TABLE SCHEDULE_TABLE(
	U_NO NUMBER PRIMARY KEY,
	S_DATE DATE NOT NULL,
	S_TIME VARCHAR2(100) NOT NULL,
	S_LOCAL VARCHAR2(20) NOT NULL,
	S_COURSE VARCHAR2(1000) NOT NULL,
	S_PEOPLE NUMBER NOT NULL,
	S_REGDATE DATE NOT NULL,
	CONSTRAINT FK_USER FOREIGN KEY(U_NO) REFERENCES USER_TABLE(U_NO)
);

SELECT * FROM SCHEDULE_TABLE;

INSERT INTO SCHEDULE_TABLE VALUES(3,TO_DATE('2018-12-24','YYYY-MM-DD') ,'08:00 ~ 20:00','제주도','동백습지 -> 한라산 -> 우도 -> 샤려니숲길',2,SYSDATE);

INSERT INTO SCHEDULE_TABLE VALUES(8,'사용자가 설정한날넣기','사용자가 설정한시간','선택한지역넣기','설정한코스',2,SYSDATE);