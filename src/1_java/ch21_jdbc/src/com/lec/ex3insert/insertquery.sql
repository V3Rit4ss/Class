INSERT INTO DEPT VALUES (60,'MARKETING','INCHON');
COMMIT;

SELECT * FROM DEPT;

DELETE FROM DEPT WHERE DEPTNO>40;
COMMIT;

SELECT * FROM DEPT WHERE DEPTNO=60;
SELECT COUNT(*) FROM DEPT WHERE DEPTNO=60;
COMMIT;







































  