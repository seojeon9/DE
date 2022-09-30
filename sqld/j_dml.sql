-- DML : ������ ���۾�
-- ���̺� ���� �߰��ϰų�(INSERT) �����ϰų�(UPDATE) ����(DELETE)

-- INSERT
-- ���ο� ���� �߰��ϴ� ����
-- INSERT INTO ���̺��(�÷���1, �÷���2...) VALUES(������1, ������2...)
-- �÷��� �������� ������ NULL�� ����.
-- ��� �÷��� ���� �ִ� ������ ��� �÷����� ������ �����ϴ�.
-- INSERT INTO ���̺�� VALUES(������1, ������2...)
INSERT INTO LSJ_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
VALUES(0,'010-0000-4141','2022-09-29', '000000-1111111', 'LSJ', 'Y', 21);

-- ���������� ������ �Է��ϱ�
CREATE TABLE LSJ_EMP_DEPT(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30 CHAR),
    DEPT_TITLE VARCHAR2(30 CHAR)
);

INSERT INTO LSJ_EMP_DEPT(
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
);

SELECT * FROM LSJ_EMP_DEPT;
COMMIT;
-- UPDATE
-- ����
-- UPDATE ���̺�� SET �÷��� = ������ ��,... [WHERE��]
-- ������ ����� �μ����� �ٲ���
UPDATE LSJ_EMP_DEPT SET DEPT_TITLE = '�λ����Ժ�';
SELECT * FROM LSJ_EMP_DEPT;
ROLLBACK;

UPDATE LSJ_EMP_DEPT SET DEPT_TITLE = '�λ����Ժ�' WHERE EMP_NAME='������';
SELECT * FROM LSJ_EMP_DEPT WHERE EMP_NAME='������';

UPDATE LSJ_EMP_DEPT 
SET DEPT_TITLE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '������')
WHERE EMP_NAME='������';
SELECT * FROM LSJ_EMP_DEPT WHERE EMP_NAME='������';

-- 5. DELETE
-- ���̺��� ���� �����ϴ� ����
-- WHERE �� �������� ������ ��� �����Ͱ� �������.
-- DELETE FROM ���̺�� WHERE ���ǽ�

-- LSJ_EMP_DEPT ������ �����ϱ�
DELETE LSJ_EMP_DEPT WHERE EMP_NAME='������';
SELECT * FROM LSJ_EMP_DEPT WHERE EMP_NAME='������';
ROLLBACK;

-- TRUNCATE : ���̺� ��ü �� ����
--             ���� : ������.
--             ���� : ROLLBACK�� �ȵȴ�.
TRUNCATE TABLE LSJ_EMP_DEPT;
SELECT * FROM LSJ_EMP_DEPT;
ROLLBACK;


