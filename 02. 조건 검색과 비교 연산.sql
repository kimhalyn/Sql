/* 2021/04/28 
��豳����_������ �м��� ���� SQL �Թ�_���� �˻��� �� ���� Ȱ���ϱ�
*/

/* WHERE�� ����ϱ� 
   - SELECT������ Ư�� ������ �־� �پ��� ������� ���̺� ��ȸ
   - ���ǿ� ������, �� �̸�, ǥ����, ����, ���� �� ����
*/

/* ������ ����
   - �� ������ : =, >, <, >=, <=, <>(!=)
   - ��� ������ : +, -, *, /(���а� �����ϰ� ���� �켱������ (), *, /, +, /)
   - ���� ������ : UNION, UNION ALL, MINUS, INTERSECT
   - �� ������ : AND, OR, NOT
   - SQL ������ : BETWEEN, IN, LIKE, IS NULL
   
   << ���ڴ� ���� ����ǥ('')�ȿ� �Է��ϵ�, ��/�ҹ��� ���� >>
*/

/* ���ǰ˻� ���� �ۼ��ϱ� */
SELECT * 
FROM JOBS
WHERE MAX_SALARY BETWEEN 5000 AND 10000;

SELECT * 
FROM LOCATIONS
WHERE city IN('Roma', 'Sydney', 'London'); /* '����'(��/�ҹ��� ����) */

SELECT *
FROM LOCATIONS
WHERE street_address LIKE '%Vi%';

SELECT * 
FROM LOCATIONS
WHERE city LIKE 'S_____';

SELECT *
FROM LOCATIONS
WHERE state_province IS NULL;

/* �񱳿��� ���� �ۼ��ϱ� */
SELECT * 
FROM LOCATIONS
WHERE location_id = 1500;

SELECT POSTAL_CODE, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE country_id = 'UK';

SELECT JOB_TITLE, MIN_SALARY
FROM JOBS
WHERE MIN_SALARY >= 5000;

/* �ǽ� 1) EMPLOYEES ���̺��� EMPLOYEE_ID�� 111�̻� 130������ ������ ���  */
SELECT *
FROM EMPLOYEES
WHERE employee_id BETWEEN 111 AND 130;

/* �ǽ� 2) EMPLOYEES ���̺��� EMAIL�� JCEHN, AKHOO, LBISSOT�� ������ ���  */
SELECT *
FROM EMPLOYEES
WHERE EMAIL IN('JCHEN', 'AKHOO', 'LBISSOT');

/* �ǽ� 3) EMPLOYEES ���̺��� JOB_ID�� IT�� �����ϴ� ��� ������ ���  */
SELECT *
FROM employees
WHERE JOB_ID LIKE 'IT%';

/* �ǽ� 4) EMPLOYEES ���̺��� COMMISSION_PCT�� ���� ����ִ� ������ ���  */
SELECT * 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

/* �ǽ� 5) EMPLOYEES ���̺��� SALARY�� 10,000�̻��� ������ ���  */
SELECT *
FROM employees
WHERE SALARY >= 10000;