/* 2021/05/03
��豳����_������ �м��� ���� SQL �Թ�_������ ���� ��ü ����
*/

/* DDL: �������� ����(Ŀ�Ծ��� �ڵ� ����)        cf)DML: �������� ����(Ŀ���Ͽ� �ݿ�)
��=Ʃ��=���ڵ�, ��=�Ӽ�=�ʵ�
CREATE TABLE: ���ο� ���̺� ����
ALTER ADD/MODIFY/RENAME(COLUMN) ~ TO/DROP COLUMN : ���̺� �߰�/����/�̸� ����(�� �̸� ����)/�� ����
TRUNCATE: ���̺��� �����͸� ��� ������ �� ���(������ �״�� ����)
DROP: ���̺� ���� ����(������ ������)
*/

CREATE TABLE MOSAIC
(MOSAIC_ID NUMBER,
MOSAIC_NAME VARCHAR2(20),
EMAIL VARCHAR2(20)
);

/* ������ ���̺� Ȯ�� */ 
SELECT *
FROM MOSAIC;

INSERT INTO MOSAIC VALUES(1, 'KIM', 'KIM@MOSAICIT.COM');

ALTER TABLE MOSAIC 
ADD (TEL VARCHAR2(13));

ALTER TABLE MOSAIC
MODIFY (MOSAIC_NAME CHAR(15));

ALTER TABLE MOSAIC
RENAME COLUMN TEL TO PHONE;

ALTER TABLE MOSAIC
DROP COLUMN PHONE;

TRUNCATE TABLE MOSAIC;

DROP TABLE MOSAIC;

/* �ǽ� 1) SHOP_ID�� NUMBER, ITEM�� VARCHAR1(30), PRICE�� NUMBER ������ SHOPPING ���̺� ���� */
CREATE TABLE SHOPPING
(SHOP_ID NUMBER, 
ITEM VARCHAR2(30),
PRICE NUMBER
);

SELECT * 
FROM SHOPPING;

/* �ǽ� 2) SHOPPING ���̺� �ʵ���� ADDR, Ÿ���� VARCHAR2(200)�� �ʵ带 ���� */
ALTER TABLE SHOPPING
ADD(ADDR VARCHAR2(200));

/* �ǽ� 3) SHOPPING ���̺� ���� */
DROP TABLE SHOPPING;