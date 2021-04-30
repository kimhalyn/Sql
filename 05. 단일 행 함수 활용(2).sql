/* 2021/04/30
통계교육원_데이터 분석을 위한 SQL 입문_단일 행 함수를 활용하여 데이터 조회(2)
*/

/* 숫자 함수 
ROUND: 숫자 반올림
TRUNC: 숫자 절삭
MOD: 숫자 나누기 후 나머지 구하기
CEIL: 숫자 정수로 올림
FLOOR: 숫자 정수로 내림
SIGN: 양수, 음수, 0인지 구분하여 출력
POWER: 거듭제곱
SQRT: 제곱근
*/

SELECT MAX_SALARY,
       MAX_SALARY/30,
       ROUND(MAX_SALARY/30), /* 소수 첫째 자리에서 반올림 */
       ROUND(MAX_SALARY/30, 1), /* 소수 둘째 자리에서 반올림 */
       ROUND(MAX_SALARY/30, -1) /* 정수 첫째 자리에서 반올림 */
FROM JOBS;

SELECT MAX_SALARY,
       MAX_SALARY/30,
       TRUNC(MAX_SALARY/30), 
       TRUNC(MAX_SALARY/30, 1), 
       TRUNC(MAX_SALARY/30, -1) 
FROM JOBS;

/* 날짜 함수
SYSDATE: 시스템 현재 날짜
ADD_MONTHS: 지정한 날짜에 지정한 개월 수 이후의 날짜 데이터 변환
MONTHS_BETWEEN: 날짜와 날짜 사이의 개월 수 (소수점 이하는 아직 한달이 안됨을 뜻함)
NEXT_DAY: 돌아오는 요일의 날짜 반환 (일요일이 1임)
LAST_DAY: 월의 마지막 날짜 반환
*/

SELECT SYSDATE 오늘,
       SYSDATE-1 어제,
       SYSDATE+1 내일
FROM DUAL;

SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 2)
FROM DUAL;

SELECT SYSDATE,
       HIRE_DATE,
       MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM EMPLOYEES;

SELECT HIRE_DATE,
       NEXT_DAY(HIRE_DATE, '수요일') /* NEXT_DAY(HIRE_DATE, '4') */
FROM EMPLOYEES;

SELECT HIRE_DATE,
       LAST_DAY(HIRE_DATE)
FROM EMPLOYEES;

/* 변환 함수 
TO_CHAR: 숫자, 날짜 데이터를 문자 데이터로 변환
TO_NUMBER: 문자 데이터를 숫자 데이터로 변환
TO_DATE: 문자열 데이터를 날짜 데이터로 변환
*/

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MM/SS')
FROM DUAL;

SELECT TO_NUMBER('1234')
FROM DUAL;

SELECT TO_DATE('20210430', 'YYYY/MM/DD')
FROM DUAL;

/* 일반 함수 
NVL: 입력 값이 NULL이 아니면 데이터 값 반환, NULL이면 지정한 데이터 값 반환
NVL2: NVL과 유사하지만 기존 데이터 값 대신 다른 값으로 지정 가능
DECODE: 기준이 되는 데이터를 지정하고, 해당 값에 따라 다른 결과 값을 반환
CASE ~WHEN 조건 THEN 출력 값1...ELSE 출력 값3 END
RANK: 공통 순위면 건너뛰고 다음 순위 출력
DENSE_RANK: 공통 순위에 건너뛰지 않고 다음 순위 출력
ROW_NUMBER: 공통 순위 없이 출력
*/

SELECT MANAGER_ID, 
       MANAGER_ID*10,
       NVL(MANAGER_ID*10, 1),
       NVL2(MANAGER_ID, '정상', '공백') AS 구분
FROM DEPARTMENTS;

SELECT JOB_ID,
       SALARY 급여,
       DECODE(JOB_ID, 'IT_PROG', SALARY*1.2, SALARY) 최종급여
FROM EMPLOYEES;

SELECT MAX_SALARY,
       CASE WHEN MAX_SALARY > 10000 THEN '고연봉'
            WHEN MAX_SALARY BETWEEN 8000 AND 9999 THEN '중간연봉'
            ELSE '저연동'
       END AS 연봉구분
FROM JOBS;

SELECT MAX_SALARY,
       RANK()       OVER(ORDER BY MAX_SALARY DESC) RANK순위,
       DENSE_RANK() OVER(ORDER BY MAX_SALARY DESC) DEMSE순위,
       ROW_NUMBER() OVER(ORDER BY MAX_SALARY DESC)ROW순위
FROM JOBS;

/* 실습 1) EMPLOYEES 테이블에서 HIRE_DATE에 20년이 지난 날짜 출력  */
SELECT HIRE_DATE,
       ADD_MONTHS(HIRE_DATE, 240)
FROM EMPLOYEES;

/* 실습 2) 문자 데이터 3000에서 문자 데이터 1500을 뺀 값 출력  */
SELECT TO_NUMBER('3000')-TO_NUMBER('1500')
FROM DUAL;

/* 실습 3) LOCATIONS 테이블에서 COUNTRY_ID가 IT면 이탈리아, US면 미국, CH면 독일, 나머지는 기타로 출력  */
SELECT COUNTRY_ID,
       CASE WHEN COUNTRY_ID='IT' THEN '이탈리아'
            WHEN COUNTRY_ID='US' THEN '미국'
            WHEN COUNTRY_ID='CH' THEN '독일'
            ELSE '기타'
       END
FROM LOCATIONS;

