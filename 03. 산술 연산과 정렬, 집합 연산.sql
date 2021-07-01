/* 2021/04/29 
��豳����_������ �м��� ���� SQL �Թ�_��� ����� ����, ���� ����
*/

/* ��� ������ */
SELECT MIN_SALARY, MIN_SALARY+100, MIN_SALARY-100, MIN_SALARY*0.1
FROM JOBS;

SELECT MIN_SALARY AS �ּұ޿�,
       MIN_SALARY+100 AS �λ�޿�,
       MIN_SALARY-100 AS ���ϱ޿�,
       MIN_SALARY*0.1 AS ����
FROM JOBS;

/* ���� ���� �ۼ� */
SELECT DEPARTMENT_ID, LOCATION_ID
FROM DEPARTMENTS
ORDER BY LOCATION_ID DESC; 

SELECT *
FROM DEPARTMENTS
ORDER BY LOCATION_ID, department_id DESC;

/* �� ������ */
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

/* ���� ������ */
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

/* �ǽ� 1) EMPLOYEES ���̺��� SALARY, SALARY�� 50%�� ���� �����͸� �������� ���  */
SELECT SALARY, 
       SALARY*0.5 AS ����
FROM EMPLOYEES;

/* �ǽ� 2) EMPLOYEES ���̺��� JOB_ID ��������, HIRE_DATE ������������ ������ ���  */
SELECT *
FROM EMPLOYEES
ORDER BY JOB_ID DESC, HIRE_DATE;

/* �ǽ� 3) LOCATIONS ���̺��� LOACATION_ID, CITY�� COUNTRY_ID�� UK�� ������ �����ϰ� ���  */
SELECT LOCATION_ID, CITY, COUNTRY_ID
FROM LOCATIONS
MINUS
SELECT LOCATION_ID, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID = 'UK';