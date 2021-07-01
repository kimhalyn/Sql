/* 2021/05/01
��豳����_������ �м��� ���� SQL �Թ�_�پ��� ���̺��� ������ Ȱ��(����)
*/

/* ����
���� ����(���� ����): �� �� �̻��� ���̺��� ������ �����͸� ã�Ƴ��� ���
�ܺ� ����: ���̺� �� �����ϴ� �ʵ��� ������ �Ȱ��� ���� ��� ���, �����Ͱ� �� ���� ���� ������(+�� �����Ͱ� ������ �ʿ� ���)
���� ����: �ڽ��� ���̺��� �ϳ� �� �����Ͽ� ���ϴ� �����͸� ����� �� ���(������ ������ �ٸ� ������ ������ ��� ����)
*/

SELECT *
FROM JOBS A, JOB_HISTORY B
WHERE A.JOB_ID = B.JOB_ID; 

SELECT A.JOB_ID, B.EMPLOYEE_ID, C.EMPLOYEE_ID, C.SALARY, C.FIRST_NAME
FROM JOBS A, JOB_HISTORY B, EMPLOYEES C
WHERE A.JOB_ID = B.JOB_ID
      AND B.EMPLOYEE_ID = C.EMPLOYEE_ID;

/* �ܺ� ���� 
WHERE B.DEPARTMENT_ID = A.DEPARTMENT_ID(+) ���� �ܺ� ����
WHERE B.DEPARTMENT_ID(+) = A.DEPARTMENT_ID ������ �ܺ� ����
*/    
SELECT B.FIRST_NAME, B.DEPARTMENT_ID, A.DEPARTMENT_ID, A.DEPARTMENT_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE B.DEPARTMENT_ID = A.DEPARTMENT_ID(+);


/* �ǽ� 1) LOCATIONS, COUNTRIES ���̺��� COUNTRY_ID�� ������ �����͸� ��� */
SELECT A.LOCATION_ID, A.CITY, B.COUNTRY_ID, B.COUNTRY_NAME
FROM LOCATIONS A, COUNTRIES B
WHERE A.COUNTRY_ID = B.COUNTRY_ID;

/* �ǽ� 2) LOCATIONS, COUNTRIES ���̺��� COUNTRY_ID�� ������ LOCATIONS ��� ������ ��� */
SELECT A.LOCATION_ID, A.CITY, B.COUNTRY_ID, B.COUNTRY_NAME
FROM LOCATIONS A, COUNTRIES B
WHERE A.COUNTRY_ID(+) = B.COUNTRY_ID;

/* �ǽ� 3) LOCATIONS ���̺��� �̿��Ͽ� CITY,�� COUNTRY_ID ���(��ü ����) */
SELECT A.CITY, B.COUNTRY_ID
FROM LOCATIONS A, LOCATIONS B
WHERE A.COUNTRY_ID = B.COUNTRY_ID;