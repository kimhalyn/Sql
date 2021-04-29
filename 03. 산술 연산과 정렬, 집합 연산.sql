/* 2021/04/29 
통계교육원_데이터 분석을 위한 SQL 입문_산술 연산과 정렬, 집합 연산
*/

/* 산술 연산자 */
SELECT MIN_SALARY, MIN_SALARY+100, MIN_SALARY-100, MIN_SALARY*0.1
FROM JOBS;

SELECT MIN_SALARY AS 최소급여,
       MIN_SALARY+100 AS 인상급여,
       MIN_SALARY-100 AS 인하급여,
       MIN_SALARY*0.1 AS 세금
FROM JOBS;

/* 정렬 쿼리 작성 */
SELECT DEPARTMENT_ID, LOCATION_ID
FROM DEPARTMENTS
ORDER BY LOCATION_ID DESC; 

SELECT *
FROM DEPARTMENTS
ORDER BY LOCATION_ID, department_id DESC;

/* 논리 연산자 */
SELECT *
FROM  EMPLOYEES
WHERE EMPLOYEE_ID < 150 
AND   salary >= 10000; 

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID < 150
AND   SALARY >= 1000
OR    MANAGER_ID = 100;

SELECT *
FROM DEPARTMENTS
WHERE LOCATION_ID <> 1700;

SELECT *
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;

/* 집합 연산자 */
SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
WHERE manager_id = 114
UNION
SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
WHERE manager_id = 120;

SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
WHERE manager_id = 100
UNION ALL
SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
WHERE manager_id = 100;

SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
MINUS
SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
WHERE manager_id = 100;

SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
INTERSECT
SELECT employee_id, first_name, email, manager_id
FROM EMPLOYEES
WHERE manager_id = 100;

/* 실습 1) EMPLOYEES 테이블에서 SALARY, SALARY에 50%를 곱한 데이터를 세금으로 출력  */
SELECT SALARY, 
       SALARY*0.5 AS 세금
FROM EMPLOYEES;

/* 실습 2) EMPLOYEES 테이블에서 JOB_ID 내림차순, HIRE_DATE 오름차순으로 데이터 출력  */
SELECT *
FROM EMPLOYEES
ORDER BY JOB_ID DESC, HIRE_DATE;

/* 실습 3) LOCATIONS 테이블에서 LOACATION_ID, CITY와 COUNTRY_ID가 UK인 데이터 제외하고 출력  */
SELECT LOCATION_ID, CITY, COUNTRY_ID
FROM LOCATIONS
MINUS
SELECT LOCATION_ID, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID = 'UK';