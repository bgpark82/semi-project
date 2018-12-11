CREATE SEQUENCE RA_SEQ;
DROP SEQUENCE RA_SEQ;

DROP TABLE RATING_TABLE;
CREATE TABLE RATING_TABLE(
	RA_NO NUMBER PRIMARY KEY,
	U_NO NUMBER NOT NULL,
	D_NO NUMBER NOT NULL,
	RA_RATING NUMBER NOT NULL
);

SELECT * FROM RATING_TABLE;





