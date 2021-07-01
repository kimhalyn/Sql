/* 2021/05/03
��豳����_������ �м��� ���� SQL �Թ�_������ �Է°� ����
*/

/* DML: �����͸� ����
INSERT INTO VALUES: ���ο� ������ ����
UPDATE SET WHERE: ���� ������ ����
DELETE FROM WHERE: ���� ������ ����
*/

INSERT INTO regions(region_id, region_name) VALUES(5, 'Korea');

INSERT INTO REGIONS VALUES(6, 'FRANCE');

UPDATE REGIONS SET REGION_NAME='ITALIA' WHERE REGION_ID=5;

/* REGION_ID�� �⺻ Ű�� NULL���� ���� �� �����Ƿ� ERROR �߻� */
UPDATE REGIONS SET REGION_ID=NULL  WHERE REGION_NAME='ITALIA'; 

DELETE FROM REGIONS WHERE REGION_ID=5;

/* �ǽ� 1) JOBS ���̺� JOB_ID:IT_AI, JOB_TITLE:DBA, MIN_SALARY:4500, MAX_SALARY:9000 ���� */
INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) 
       VALUES('IT_AI', 'DBA', 4500, 9000);
       
/* �ǽ� 2) JOBS ���̺� JOB_ID:IT_AI���� MAX_SALARY:11000���� ���� */
UPDATE JOBS 
SET    MAX_SALARY=11000 
WHERE  JOB_ID='IT_AI';

/* �ǽ� 3) JOBS ���̺� JOB_ID:IT_AI ������ ����*/
DELETE FROM JOBS 
WHERE       SJOB_ID='IT_AI';