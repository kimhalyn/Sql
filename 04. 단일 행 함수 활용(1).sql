/* 2021/04/29 
통계교육원_데이터 분석을 위한 SQL 입문_단일 행 함수를 활용하여 데이터 조회(1)
*/

/* 데이터 타입
CHAR(n): n크기만큼 고정 길이의 문자 타입을 저장
VARCHAR2(n): n크기만큼 가변 길이의 문자 타입을 저장
NUMBER(p,s): 숫자 타입 저장(정수, 소수)
DATE: 날짜 타입 저장
*/

/* 문자함수 
UPPER(): 문자 데이터를 대문자로 변환
LOWER(): 문자 데이터를 소문자로 변환
INITCAP(): 문자 데이터 중 첫글자를 대문자, 나머지는 소문자로 변환
SUBSTR(): 지정한 길이만큼 문자열 추출
REPLACE(): 특정 문자를 찾아서 다른 문자로 바꿈
LPAD(): 왼쪽부터 특정 문자로 자릿수를 채울 때
RPAD(): 오른쪽부터 특정 문자로 자릿수를 채울 때
LTRIM(): 왼쪽부터 지정한 문자를 지울 때
RTRIM(): 오른쪽부터 지정한 문자를 지울 때
TRIM(): 공백을 제거할 때 사용(문자열 중간에 있는 공백은 삭제 불가)
LENGTH(): 문자열 길이를 구할 때 사용
CONCAT(): 두 개의 문자열을 하나로 합칠 때 
*/

SELECT job_title, UPPER(job_title), LOWER(job_title), INITCAP(job_title)
FROM JOBS;

SELECT JOB_ID, SUBSTR(JOB_ID, 1, 2), SUBSTR(JOB_ID, 4, 2), SUBSTR(JOB_ID, 4)
FROM JOB_HISTORY;

SELECT JOB_ID, REPLACE(job_id, 'CLERK', 'CL')
FROM EMPLOYEES;

/* EMAIL값을 10자리 문자열로 변경하고, 10자리보다 작으면 왼쪽부터 '@' */
SELECT EMAIL, LPAD(EMAIL, 10, '@')
FROM EMPLOYEES;

SELECT EMAIL, RPAD(EMAIL, 10, '@')
FROM EMPLOYEES;

SELECT JOB_ID, LTRIM(JOB_ID, 'S')
FROM JOB_HISTORY;

SELECT JOB_ID, RTRIM(JOB_ID, 'K')
FROM JOB_HISTORY;

SELECT 'SEOUL'||TRIM('    - gu -    ')||'KOREA'
FROM DUAL;

SELECT job_id, LENGTH(job_id)
FROM JOB_HISTORY;

SELECT CONCAT(first_name, last_name),
       CONCAT(first_name, CONCAT(', ', last_name))
FROM EMPLOYEES;

/* 실습 1) JOB_HISTORY 테이블에서 JOB_ID의 바이트 길이 출력  */
SELECT job_id, LENGTHB(job_id)
FROM JOB_HISTORY;

/* 실습 2) JOB_HISTORY 테이블에서 JOB_ID를 소문자로 출력  */
SELECT job_id, LOWER(job_id)
FROM JOB_HISTORY;

/* 실습 3) JOB_HISTORY 테이블에서 DEPARTMENT_ID값을 5자리로 출력(5자리보다 작을 시 왼쪽부터 0)  */
SELECT department_id, LPAD(department_id, 5, '0')
FROM JOB_HISTORY;

