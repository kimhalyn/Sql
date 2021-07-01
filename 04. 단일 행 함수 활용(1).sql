/* 2021/04/29 
��豳����_������ �м��� ���� SQL �Թ�_���� �� �Լ��� Ȱ���Ͽ� ������ ��ȸ(1)
*/

/* ������ Ÿ��
CHAR(n): nũ�⸸ŭ ���� ������ ���� Ÿ���� ����
VARCHAR2(n): nũ�⸸ŭ ���� ������ ���� Ÿ���� ����
NUMBER(p,s): ���� Ÿ�� ����(����, �Ҽ�)
DATE: ��¥ Ÿ�� ����
*/

/* �����Լ� 
UPPER(): ���� �����͸� �빮�ڷ� ��ȯ
LOWER(): ���� �����͸� �ҹ��ڷ� ��ȯ
INITCAP(): ���� ������ �� ù���ڸ� �빮��, �������� �ҹ��ڷ� ��ȯ
SUBSTR(): ������ ���̸�ŭ ���ڿ� ����
REPLACE(): Ư�� ���ڸ� ã�Ƽ� �ٸ� ���ڷ� �ٲ�
LPAD(): ���ʺ��� Ư�� ���ڷ� �ڸ����� ä�� ��
RPAD(): �����ʺ��� Ư�� ���ڷ� �ڸ����� ä�� ��
LTRIM(): ���ʺ��� ������ ���ڸ� ���� ��
RTRIM(): �����ʺ��� ������ ���ڸ� ���� ��
TRIM(): ������ ������ �� ���(���ڿ� �߰��� �ִ� ������ ���� �Ұ�)
LENGTH(): ���ڿ� ���̸� ���� �� ���
CONCAT(): �� ���� ���ڿ��� �ϳ��� ��ĥ �� 
*/

SELECT job_title, UPPER(job_title), LOWER(job_title), INITCAP(job_title)
FROM JOBS;

SELECT JOB_ID, SUBSTR(JOB_ID, 1, 2), SUBSTR(JOB_ID, 4, 2), SUBSTR(JOB_ID, 4)
FROM JOB_HISTORY;

SELECT JOB_ID, REPLACE(job_id, 'CLERK', 'CL')
FROM EMPLOYEES;

/* EMAIL���� 10�ڸ� ���ڿ��� �����ϰ�, 10�ڸ����� ������ ���ʺ��� '@' */
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

/* �ǽ� 1) JOB_HISTORY ���̺��� JOB_ID�� ����Ʈ ���� ���  */
SELECT job_id, LENGTHB(job_id)
FROM JOB_HISTORY;

/* �ǽ� 2) JOB_HISTORY ���̺��� JOB_ID�� �ҹ��ڷ� ���  */
SELECT job_id, LOWER(job_id)
FROM JOB_HISTORY;

/* �ǽ� 3) JOB_HISTORY ���̺��� DEPARTMENT_ID���� 5�ڸ��� ���(5�ڸ����� ���� �� ���ʺ��� 0)  */
SELECT department_id, LPAD(department_id, 5, '0')
FROM JOB_HISTORY;

