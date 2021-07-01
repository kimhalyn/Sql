/* 2021/04/30
��豳����_������ �м��� ���� SQL �Թ�_���� �� �Լ��� Ȱ���Ͽ� ������ ��ȸ(2)
*/

/* ���� �Լ� 
ROUND: ���� �ݿø�
TRUNC: ���� ����
MOD: ���� ������ �� ������ ���ϱ�
CEIL: ���� ������ �ø�
FLOOR: ���� ������ ����
SIGN: ���, ����, 0���� �����Ͽ� ���
POWER: �ŵ�����
SQRT: ������
*/

SELECT MAX_SALARY,
       MAX_SALARY/30,
       ROUND(MAX_SALARY/30), /* �Ҽ� ù° �ڸ����� �ݿø� */
       ROUND(MAX_SALARY/30, 1), /* �Ҽ� ��° �ڸ����� �ݿø� */
       ROUND(MAX_SALARY/30, -1) /* ���� ù° �ڸ����� �ݿø� */
FROM JOBS;

SELECT MAX_SALARY,
       MAX_SALARY/30,
       TRUNC(MAX_SALARY/30), 
       TRUNC(MAX_SALARY/30, 1), 
       TRUNC(MAX_SALARY/30, -1) 
FROM JOBS;

/* ��¥ �Լ�
SYSDATE: �ý��� ���� ��¥
ADD_MONTHS: ������ ��¥�� ������ ���� �� ������ ��¥ ������ ��ȯ
MONTHS_BETWEEN: ��¥�� ��¥ ������ ���� �� (�Ҽ��� ���ϴ� ���� �Ѵ��� �ȵ��� ����)
NEXT_DAY: ���ƿ��� ������ ��¥ ��ȯ (�Ͽ����� 1��)
LAST_DAY: ���� ������ ��¥ ��ȯ
*/

SELECT SYSDATE ����,
       SYSDATE-1 ����,
       SYSDATE+1 ����
FROM DUAL;

SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 2)
FROM DUAL;

SELECT SYSDATE,
       HIRE_DATE,
       MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM EMPLOYEES;

SELECT HIRE_DATE,
       NEXT_DAY(HIRE_DATE, '������') /* NEXT_DAY(HIRE_DATE, '4') */
FROM EMPLOYEES;

SELECT HIRE_DATE,
       LAST_DAY(HIRE_DATE)
FROM EMPLOYEES;

/* ��ȯ �Լ� 
TO_CHAR: ����, ��¥ �����͸� ���� �����ͷ� ��ȯ
TO_NUMBER: ���� �����͸� ���� �����ͷ� ��ȯ
TO_DATE: ���ڿ� �����͸� ��¥ �����ͷ� ��ȯ
*/

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MM/SS')
FROM DUAL;

SELECT TO_NUMBER('1234')
FROM DUAL;

SELECT TO_DATE('20210430', 'YYYY/MM/DD')
FROM DUAL;

/* �Ϲ� �Լ� 
NVL: �Է� ���� NULL�� �ƴϸ� ������ �� ��ȯ, NULL�̸� ������ ������ �� ��ȯ
NVL2: NVL�� ���������� ���� ������ �� ��� �ٸ� ������ ���� ����
DECODE: ������ �Ǵ� �����͸� �����ϰ�, �ش� ���� ���� �ٸ� ��� ���� ��ȯ
CASE ~WHEN ���� THEN ��� ��1...ELSE ��� ��3 END
RANK: ���� ������ �ǳʶٰ� ���� ���� ���
DENSE_RANK: ���� ������ �ǳʶ��� �ʰ� ���� ���� ���
ROW_NUMBER: ���� ���� ���� ���
*/

SELECT MANAGER_ID, 
       MANAGER_ID*10,
       NVL(MANAGER_ID*10, 1),
       NVL2(MANAGER_ID, '����', '����') AS ����
FROM DEPARTMENTS;

SELECT JOB_ID,
       SALARY �޿�,
       DECODE(JOB_ID, 'IT_PROG', SALARY*1.2, SALARY) �����޿�
FROM EMPLOYEES;

SELECT MAX_SALARY,
       CASE WHEN MAX_SALARY > 10000 THEN '����'
            WHEN MAX_SALARY BETWEEN 8000 AND 9999 THEN '�߰�����'
            ELSE '������'
       END AS ��������
FROM JOBS;

SELECT MAX_SALARY,
       RANK()       OVER(ORDER BY MAX_SALARY DESC) RANK����,
       DENSE_RANK() OVER(ORDER BY MAX_SALARY DESC) DEMSE����,
       ROW_NUMBER() OVER(ORDER BY MAX_SALARY DESC)ROW����
FROM JOBS;

/* �ǽ� 1) EMPLOYEES ���̺��� HIRE_DATE�� 20���� ���� ��¥ ���  */
SELECT HIRE_DATE,
       ADD_MONTHS(HIRE_DATE, 240)
FROM EMPLOYEES;

/* �ǽ� 2) ���� ������ 3000���� ���� ������ 1500�� �� �� ���  */
SELECT TO_NUMBER('3000')-TO_NUMBER('1500')
FROM DUAL;

/* �ǽ� 3) LOCATIONS ���̺��� COUNTRY_ID�� IT�� ��Ż����, US�� �̱�, CH�� ����, �������� ��Ÿ�� ���  */
SELECT COUNTRY_ID,
       CASE WHEN COUNTRY_ID='IT' THEN '��Ż����'
            WHEN COUNTRY_ID='US' THEN '�̱�'
            WHEN COUNTRY_ID='CH' THEN '����'
            ELSE '��Ÿ'
       END
FROM LOCATIONS;

