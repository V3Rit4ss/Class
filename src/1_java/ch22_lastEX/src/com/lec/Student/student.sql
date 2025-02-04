-- 21.0108 예제
DROP TABLE STUDENT1;
DROP TABLE MAJOR1;

DROP SEQUENCE  STDEUNT1_SEQ;

SELECT * FROM MAJOR1; --생성 확인.
SELECT * FROM STUDENT1;
SELECT * FROM USER_SEQUENCES;

CREATE TABLE MAJOR1 (
    mNO NUMBER(2) PRIMARY KEY,
    mNAME VARCHAR2(50)

); 

CREATE TABLE STUDENT1 (
    sNO VARCHAR2(7) PRIMARY KEY,
    sNAME VARCHAR2(30),
    mNO NUMBER(2) REFERENCES MAJOR1 (mNO),
    SCORE NUMBER(3) DEFAULT 0 CHECK (SCORE >=0 AND SCORE <= 100),
    sEXPEL NUMBER(1) DEFAULT 0 CHECK (sEXPEL =0 OR sEXPEL= 1)
);


DROP SEQUENCE STDEUNT1_SEQ;
CREATE SEQUENCE STDEUNT1_SEQ
    MAXVALUE 999999
    NOCYCLE
    NOCACHE;


--2021001 만드는쿼리
SELECT TO_CHAR(SYSDATE, 'YYYY')||TRIM(TO_CHAR(STDEUNT1_SEQ.NEXTVAL, '000')) FROM DUAL;

SELECT TO_CHART(SYSDATE, 'YYYY')||LPAD(STUDENT1_SEQ.NEXTVAL, 3, '0') FROM DUAL;

SELECT * FROM USER_SEQUENCES;
SELECT STUDENT1_SEQ.CURRVAL FROM DUAL;

--INSERT INTO FRIEND (NUM,NAME,PHONE) VALUES (FRIEND_SEQ.NEXTVAL,'홍길동','010-9999-9999');
    INSERT INTO MAJOR1 VALUES (1, '빅데이터학');
	INSERT INTO MAJOR1 VALUES (2, '경영정보학');
	INSERT INTO MAJOR1 VALUES (3, '컴퓨터공학');
	INSERT INTO MAJOR1 VALUES (4, '소프트웨어');
	INSERT INTO MAJOR1 VALUES (5, '인공지능학');	
ROLLBACK;

SELECT * FROM MAJOR1;
SELECT * FROM STUDENT1;
INSERT INTO STUDENT1 VALUES (TO_CHAR(SYSDATE, 'YYYY')||TRIM(TO_CHAR(STDEUNT1_SEQ.NEXTVAL, '000')), '정우성', (SELECT mNO FROM MAJOR1 WHERE mNAME='빅데이터학'),90,0);
INSERT INTO STUDENT1 VALUES (TO_CHAR(SYSDATE, 'YYYY')||TRIM(TO_CHAR(STDEUNT1_SEQ.NEXTVAL, '000')), '박세영', (SELECT mNO FROM MAJOR1 WHERE mNAME='빅데이터학'),80,0);
INSERT INTO STUDENT1 VALUES (TO_CHAR(SYSDATE, 'YYYY')||TRIM(TO_CHAR(STDEUNT1_SEQ.NEXTVAL, '000')), '배수지', (SELECT mNO FROM MAJOR1 WHERE mNAME='컴퓨터공학'),20,0);
INSERT INTO STUDENT1 VALUES (TO_CHAR(SYSDATE, 'YYYY')||TRIM(TO_CHAR(STDEUNT1_SEQ.NEXTVAL, '000')), '홍길동', (SELECT mNO FROM MAJOR1 WHERE mNAME='경영정보학'),95,0);
INSERT INTO STUDENT1 VALUES (TO_CHAR(SYSDATE, 'YYYY')||TRIM(TO_CHAR(STDEUNT1_SEQ.NEXTVAL, '000')), '송혜교', (SELECT mNO FROM MAJOR1 WHERE mNAME='인공지능학'),100,0);
INSERT INTO STUDENT1 VALUES (TO_CHAR(SYSDATE, 'YYYY')||TRIM(TO_CHAR(STDEUNT1_SEQ.NEXTVAL, '000')), '홍철수', (SELECT mNO FROM MAJOR1 WHERE mNAME='소프트웨어'),10,1);

COMMIT;


-- 2를 누르면 원하는 학과이름을 입력받고,
    -- 학과별 조회후, 총점을 추가하여 총점이 높은 순으로 이름(번호)로 출력.
--1안 = ~~, SNAME = "배수지(2021003)"~~~
SELECT ROWNUM RANK, sNAME||'('||sNO||')' sNAME, mNAME, SCORE FROM (SELECT * FROM STUDENT1 S, MAJOR1 M WHERE S.mNO=m.mNO AND mNAME='컴퓨터공학' ORDER BY SCORE DESC);

--2안 = SNO(2012003) , SNAME(배수지) ~~~ 
SELECT ROWNUM RANK, sNo, sNAME, mNAME, SCORE
    FROM (SELECT * FROM STUDENT1 S, MAJOR1 M 
            WHERE S.mNO=m.mNO AND mNAME='컴퓨터공학'
            ORDER BY SCORE DESC);  
            
--3을 누르면 제적당하지 않은 전체 학생을 조회후. 점수가 높은순 출력.            
-- 1안 = SNO(2012003) , SNAME(배수지) ~~~
SELECT ROWNUM RANK, sNO, sNAME, mNAME, SCORE FROM (SELECT * FROM STUDENT1 S , MAJOR1 M WHERE S.mNO=M.mNO AND sEXPEL=0 ORDER BY SCORE DESC);      
-- 2안 = ~~, SNAME = "배수지(2021003)"~~~
SELECT ROWNUM RANK, sNAME||'('||sNO||')' sNAME, mNAME, SCORE FROM (SELECT * FROM STUDENT1 S, MAJOR1 M WHERE S.mNO=m.mNO AND sEXPEL=0 ORDER BY SCORE DESC);

-- 4. 제작당한 전체학생 조회후, 점수 높은순 출력.
SELECT ROWNUM RANK, sNAME||'('||sNO||')' sNAME, mNAME, SCORE FROM (SELECT * FROM STUDENT1 S, MAJOR1 M WHERE S.mNO=m.mNO AND sEXPEL=1 ORDER BY SCORE DESC);
--1안과 2안의 차이점은 위에 똑같이 있으니 참고바람, 3,4 다른점은 sEXPEL의 값이 0이냐 1이냐 일뿐,


-- 학번 검색.
SELECT * FROM STUDENT1 WHERE sNO='2021001';
-- 이름 검색.
SELECT * FROM STUDENT1 WHERE sNAME='송혜교';

COMMIT;


