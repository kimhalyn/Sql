/* 2021/05/03
통계교육원_데이터 분석을 위한 SQL 입문_데이터 입력과 수정
*/

/* DML: 데이터를 조작
INSERT INTO VALUES: 새로운 데이터 삽입
UPDATE SET WHERE: 기존 데이터 수정
DELETE FROM WHERE: 기존 데이터 삭제
*/

INSERT INTO regions(region_id, region_name) VALUES(5, 'Korea');

INSERT INTO REGIONS VALUES(6, 'FRANCE');

UPDATE REGIONS SET REGION_NAME='ITALIA' WHERE REGION_ID=5;

/* REGION_ID가 기본 키로 NULL값을 가질 수 없으므로 ERROR 발생 */
UPDATE REGIONS SET REGION_ID=NULL  WHERE REGION_NAME='ITALIA'; 

DELETE FROM REGIONS WHERE REGION_ID=5;

/* 실습 1) JOBS 테이블에 JOB_ID:IT_AI, JOB_TITLE:DBA, MIN_SALARY:4500, MAX_SALARY:9000 삽입 */
INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) 
       VALUES('IT_AI', 'DBA', 4500, 9000);
       
/* 실습 2) JOBS 테이블에 JOB_ID:IT_AI행의 MAX_SALARY:11000으로 수정 */
UPDATE JOBS 
SET    MAX_SALARY=11000 
WHERE  JOB_ID='IT_AI';

/* 실습 3) JOBS 테이블에 JOB_ID:IT_AI 데이터 삭제*/
DELETE FROM JOBS 
WHERE       SJOB_ID='IT_AI';