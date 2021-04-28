/* 2021/04/28 
통계교육원_데이터 분석을 위한 SQL 입문_조건 검색과 비교 연산 활용하기
*/

/* WHERE절 사용하기 
   - SELECT문으로 특정 조건을 주어 다양한 방법으로 테이블 조회
   - 조건에 연산자, 열 이름, 표현식, 숫자, 문자 등 포함
*/

/* 연산자 종류
   - 비교 연산자 : =, >, <, >=, <=, <>(!=)
   - 산술 연산자 : +, -, *, /(수학과 동일하게 연산 우선순위는 (), *, /, +, /)
   - 집합 연산자 : UNION, UNION ALL, MINUS, INTERSECT
   - 논리 연산자 : AND, OR, NOT
   - SQL 연산자 : BETWEEN, IN, LIKE, IS NULL
   
   << 문자는 작은 따옴표('')안에 입력하되, 대/소문자 구분 >>
*/

/* 조건검색 쿼리 작성하기 */
SELECT * 
FROM JOBS
WHERE MAX_SALARY BETWEEN 5000 AND 10000;

SELECT * 
FROM LOCATIONS
WHERE city IN('Roma', 'Sydney', 'London'); /* '문자'(대/소문자 구분) */

SELECT *
FROM LOCATIONS
WHERE street_address LIKE '%Vi%';

SELECT * 
FROM LOCATIONS
WHERE city LIKE 'S_____';

SELECT *
FROM LOCATIONS
WHERE state_province IS NULL;

/* 비교연산 쿼리 작성하기 */
SELECT * 
FROM LOCATIONS
WHERE location_id = 1500;

SELECT POSTAL_CODE, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE country_id = 'UK';

SELECT JOB_TITLE, MIN_SALARY
FROM JOBS
WHERE MIN_SALARY >= 5000;

/* 실습 1) EMPLOYEES 테이블에서 EMPLOYEE_ID가 111이상 130이하인 데이터 출력  */
SELECT *
FROM EMPLOYEES
WHERE employee_id BETWEEN 111 AND 130;

/* 실습 2) EMPLOYEES 테이블에서 EMAIL이 JCEHN, AKHOO, LBISSOT인 데이터 출력  */
SELECT *
FROM EMPLOYEES
WHERE EMAIL IN('JCHEN', 'AKHOO', 'LBISSOT');

/* 실습 3) EMPLOYEES 테이블에서 JOB_ID가 IT로 시작하는 모든 데이터 출력  */
SELECT *
FROM employees
WHERE JOB_ID LIKE 'IT%';

/* 실습 4) EMPLOYEES 테이블에서 COMMISSION_PCT의 값이 비어있는 데이터 출력  */
SELECT * 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

/* 실습 5) EMPLOYEES 테이블에서 SALARY가 10,000이상인 데이터 출력  */
SELECT *
FROM employees
WHERE SALARY >= 10000;