DROP TABLE LIKE_TABLE;
DROP SEQUENCE LIKE_NO_SEQ;

CREATE SEQUENCE LIKE_NO_SEQ;
CREATE TABLE LIKE_TABLE(
LIKE_NO NUMBER PRIMARY KEY,
R_NO NUMBER NOT NULL,
U_NO NUMBER NOT NULL,
LIKE_CHECK NUMBER DEFAULT 0 NULL,
FOREIGN KEY (U_NO) REFERENCES USER_TABLE (U_NO),
FOREIGN KEY (R_NO) REFERENCES REVIEWBOARD (R_NO)
);

INSERT INTO LIKE_TABLE VALUES(LIKE_NO_SEQ.NEXTVAL, 0, 0, 0);

SELECT * FROM LIKE_TABLE;
