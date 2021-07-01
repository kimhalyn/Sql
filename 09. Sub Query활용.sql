/* 2021/05/03
��豳����_������ �м��� ���� SQL �Թ�_Sub QueryȰ��
*/

/* ���� ����: SELECT�� �ȿ� �� �ٸ� SELECT���� ����� ����(���� ���� ���� �� ���� ���� ����)
���� �� ���� ����: �ϳ��� ���� �˻�
���� �� ���� ����: �ϳ� �̻��� ���� �˻�(IN, NOT IN, EXISTS, ANY, ALL)
���� �� ���� ����: �ϳ� �̻��� ���� �˻�(WHERE������ �񱳵Ǵ� ���� ���� ��)
*/

SELECT SALARY
FROM EMPLOYEES
WHERE EMAIL='AFRIPP'; 

SELECT *
FROM EMPLOYEES
WHERE SALARY >= 8200; 

/* EMAIL�� AFRIPP�� �������� SALARY�� ���ų� ���� ������ ��� */
SELECT *
FROM EMPLOYEES
WHERE SALARY >= (SELECT SALARY
                 FROM EMPLOYEES
                 WHERE EMAIL='AFRIPP');

/* EMAIL�� AFRIPP�� ���� �� �Ի����� 2005-04-10���� �� ���� ���� ��� */
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE < (SELECT HIRE_DATE
                   FROM EMPLOYEES 
                   WHERE EMAIL='AFRIPP');
                   
/* �μ��� �ְ� �޿� */                   
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

/* �ǽ� 1) EMPLOYEES ���̺��� ���� ������ �̿��Ͽ� FIRST_NAME�� 'Neena'�� �������� HIRE_DATE�� ������ ������ ��� */
SELECT * 
FROM EMPLOYEES
WHERE HIRE_DATE < (SELECT HIRE_DATE
                   FROM EMPLOYEES
                   WHERE FIRST_NAME='Neena');
                   
/* �ǽ� 2) EMPLOYEES ���̺��� ���� ������ �̿��Ͽ� �μ��� �ּ� �޿��� ��ġ���� ���� �����͸� ��� */                
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY NOT IN (SELECT MIN(SALARY)
                          FROM EMPLOYEES
                          GROUP BY DEPARTMENT_ID);
                          
/* �ǽ� 3) EMPLOYEES ���̺��� MANAGER_ID���� ���� ���� SALARY�� ã�� MANAGER_ID�� SALARY�� �ش��ϴ� ������ ��� */                  
SELECT *
FROM EMPLOYEES
WHERE (MANAGER_ID, SALARY) IN (SELECT MANAGER_ID, MIN(SALARY) 
                               FROM EMPLOYEES
                               GROUP BY MANAGER_ID);