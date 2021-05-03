/* 2021/05/03
통계교육원_데이터 분석을 위한 SQL 입문_Sub Query활용
*/

/* 서브 쿼리: SELECT문 안에 또 다른 SELECT문이 기술된 쿼리(서브 쿼리 실행 후 메인 쿼리 실행)
단일 행 서브 쿼리: 하나의 행을 검색
다중 행 서브 쿼리: 하나 이상의 행을 검색(IN, NOT IN, EXISTS, ANY, ALL)
다중 열 서브 쿼리: 하나 이상의 열을 검색(WHERE절에서 비교되는 열이 여러 개)
*/

SELECT SALARY
FROM EMPLOYEES
WHERE EMAIL='AFRIPP'; 

SELECT *
FROM EMPLOYEES
WHERE SALARY >= 8200; 

/* EMAIL이 AFRIPP인 직원보다 SALARY가 같거나 높은 직원들 출력 */
SELECT *
FROM EMPLOYEES
WHERE SALARY >= (SELECT SALARY
                 FROM EMPLOYEES
                 WHERE EMAIL='AFRIPP');

/* EMAIL이 AFRIPP인 직원 중 입사일이 2005-04-10보다 더 빠른 직원 출력 */
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE < (SELECT HIRE_DATE
                   FROM EMPLOYEES 
                   WHERE EMAIL='AFRIPP');
                   
/* 부서별 최고 급여 */                   
SELECT MAX(SALARY), DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY IN (SELECT MAX(SALARY)
                 FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID);

SELECT *
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                  FROM EMPLOYEES
                                  GROUP BY DEPARTMENT_ID);

/* 실습 1) EMPLOYEES 테이블에서 서브 쿼리를 이용하여 FIRST_NAME이 'Neena'인 직원보다 HIRE_DATE가 이전인 직원들 출력 */
SELECT * 
FROM EMPLOYEES
WHERE HIRE_DATE < (SELECT HIRE_DATE
                   FROM EMPLOYEES
                   WHERE FIRST_NAME='Neena');
                   
/* 실습 2) EMPLOYEES 테이블에서 서브 쿼리를 이용하여 부서별 최소 급여가 일치하지 않은 데이터를 출력 */                
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY NOT IN (SELECT MIN(SALARY)
                          FROM EMPLOYEES
                          GROUP BY DEPARTMENT_ID);
                          
/* 실습 3) EMPLOYEES 테이블에서 MANAGER_ID별로 가장 낮은 SALARY를 찾아 MANAGER_ID별 SALARY에 해당하는 직원들 출력 */                  
SELECT *
FROM EMPLOYEES
WHERE (MANAGER_ID, SALARY) IN (SELECT MANAGER_ID, MIN(SALARY) 
                               FROM EMPLOYEES
                               GROUP BY MANAGER_ID);