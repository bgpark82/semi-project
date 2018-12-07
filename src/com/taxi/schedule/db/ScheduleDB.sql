
DROP SEQUENCE S_SEQ;
DROP TABLE SCHEDULE_TABLE;

SELECT *
	FROM (SELECT (ROW_NUMBER() OVER (PARTITION BY SUBSTR(S_DATE,1,10) ORDER BY S_DATE)) 
	RN, S_SEQ, U_NO, D_NO, S_NO, S_DATE, S_TIME, S_LOCATION, S_COURSE, S_PEOPLE, S_PRICE, S_REGDATE, S_LATITUDE, S_LONGITUDE, S_CONFIRMED_CHECK
			FROM SCHEDULE_TABLE WHERE U_NO = 4 AND SUBSTR(S_DATE,1,7)= '2018-12' )
	WHERE RN BETWEEN 1 AND 3;

	
	
CREATE SEQUENCE S_SEQ;
CREATE TABLE SCHEDULE_TABLE(
	S_SEQ NUMBER PRIMARY KEY,
	U_NO NUMBER NOT NULL,
	D_NO NUMBER NOT NULL,
	S_NO NUMBER NOT NULL,
	S_DATE VARCHAR2(100) NOT NULL,
	S_TIME NUMBER NOT NULL,
	S_LOCATION VARCHAR2(1000) NOT NULL,
	S_COURSE VARCHAR2(1000) NOT NULL,
	S_PEOPLE NUMBER NOT NULL,
	S_PRICE VARCHAR2(100) NOT NULL,
	S_REGDATE DATE NOT NULL,
	S_LATITUDE VARCHAR2(1000) NOT NULL,
	S_LONGITUDE VARCHAR2(1000) NOT NULL,
	S_CONFIRMED_CHECK VARCHAR2(2) NOT NULL,
	CONSTRAINT U_NO_FK FOREIGN KEY(U_NO) REFERENCES USER_TABLE(U_NO),
	CONSTRAINT D_NO_FK FOREIGN KEY(D_NO) REFERENCES DRIVER_TABLE(D_NO),
	CONSTRAINT S_CONFIRMED_CHECK_CK CHECK (S_CONFIRMED_CHECK IN ('Y','N','P'))
);

SELECT * FROM SCHEDULE_TABLE;


INSERT INTO SCHEDULE_TABLE 
VALUES(S_SEQ.NEXTVAL,4,2,1,'2018-12-24' ,'8','제주도','동백습지 -> 한라산 -> 우도 -> 샤려니숲길',2,'100,000',SYSDATE,36.12345677,123.23124155,'N');




DELETE FROM SCHEDULE_TABLE;