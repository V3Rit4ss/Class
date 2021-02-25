--[ XI ]  인덱스 : 
SELECT * FROM USER_INDEXES;   -- 딕셔너리뷰에 스콧계정이 소유한 인덱스 정보
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP; 
SELECT * FROM EMP01;
INSERT INTO EMP01 SELECT * FROM EMP01;  --1번 실행 (28개) , 2번 (56);
SELECT COUNT(*) FROM EMP01;
INSERT INTO EMP01 SELECT *  FROM EMP01; --12번 실행 (22만개). 실수로 약 92만개 행 이 만들어짐;;;
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;
INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO) VALUES (1111, 'HONG',40);
INSERT INTO EMP01 SELECT * FROM EMP01;  -- 위에서 몇번더 했으니 여기서 180만개까지만 함.
DESC EMP01;
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- 0.041초.
--인덱스 생성후 빠른조회
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME);
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- 0.01초
DROP INDEX IDX_EMP01_ENAME; --인덱스 삭제.
SELECT * FROM USER_INDEXES; --인덱스 존재 여부 확인, 테이블을 지워도 사라짐.
DROP TABLE EMP01; --트리도 같이 삭제되서 조금 걸릴수있음.
