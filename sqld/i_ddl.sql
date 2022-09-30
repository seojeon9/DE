-- create, alter, drop
-- �����͹��Ἲ : �������� ��Ȯ��, �ϰ����� �����Ǵ� ��
-- ��Ȯ�� : �ߺ��̳� ������ ���� ����
-- �ϰ��� : ���ΰ� ����� ���������� ����Ǵ� ����
--create, alter, drop
--�����͹��Ἲ : �������� ��Ȯ��, �ϰ����� �����Ǵ� ��
--��Ȯ�� : �ߺ��̳� �����̾��� ����
--�ϰ��� : ���ΰ� ����� ���������� ����Ǵ� ����

create table LSJ_EMP(
    --�⺻Ű
    --�⺻Ű�� ���̺��� �� ���� �����ϰ� �ĺ��ϴ� ������ ����Ѵ�.
    --���̺� �� �ϳ��� ���� �����ϴ�.
    --�⺻Ű�� �ּҼ�(NOT NULL) ���ϼ�(UNIQUE)�� �����Ǿ�� �Ѵ�.
    --���࿡ �ּҼ��� ���ϼ��� �����Ǵ� �÷��� ���� ���
    --��ǥ���� ���ϴ� �÷��� �⺻Ű�� �����Ѵ�.
    --�⺻Ű�� �����ϸ� ���� �ε����� �ڵ����� ������ �ȴ�.
    EID NUMBER PRIMARY KEY,

    --�÷���(�Ӽ�) Ÿ�� ��������
    --�������� ���� �÷�
    PHONE VARCHAR2(13),
    
    --DEFAULT : �⺻ �� ����, ���� ���̺� ROW�� �߰��� �� �ش� �÷������� ������ ���� ������
    --          NULL ��� �⺻������ ������ ���� �Է�
    HIRE_DATE DATE DEFAULT SYSDATE,
    
    --���� ���Ἲ(UNIQUE) : ���̺��� Ư�� �÷����� ���ؼ� �� ROW�� ������ ���� �޶���Ѵٴ� ����
    --                      �ߺ� �� �ȵ�
    ENO CHAR(14) UNIQUE,
    
    --NULL ���Ἲ : ���̺��� Ư�� �÷����� NULL�� �� �� ����
    ENAME VARCHAR2(30 CHAR) NOT NULL,
    
    --�����ι��Ἲ : Ư�� �÷����� �� �÷��� ���ǵ� �����ο� ���� ���̾�� �Ѵٴ� ����
    MARRIAGE CHAR(1) DEFAULT 'N' CHECK(MARRIAGE IN('Y','N')),
    
    AGE NUMBER CHECK(AGE > 20)
    
    --�ܷ�Ű
    --�������Ἲ : �⺻Ű�� ����Ű ���� ���谡 �׻� ���� ��
    --CONSTRAIN FOREIGN KEY(�÷���) REFERENCES �θ����̺�(�÷���)
    --ON UPDATE CASCADE : �θ����̺��� ���� �����Ǹ� �ڽ����̺��� �൵ ���� ����(����Ŭ ����X)
    --ON DELETE CASCADE : �θ����̺��� ���� �����Ǹ� �ڽ� ���̺��� �൵ ���� ����, 
    --                  �ɼ� ���� ���ϸ� �θ����̺� ������ ���� �Ұ���
    --ON DELETE SET NULL : �θ����̺��� ���� �����Ǹ� �ڽ����̺��� ���� NULL�� ����    
);

--�������� ��ܺ���
--1. AGE�� 20���� ���� ���� �ְ�, MARRIAGE�� 'Z'�� �־ �����ι��Ἲ�� ��ܺ���!
--2. NOT NULL �� ������ �÷��� NULL�� �־ NULL���Ἲ�� ��ܺ���!
--3. PROMARY KEY�� ������ E_ID�� NULL���� �־ �⺻Ű�� �ּҼ��� Ȯ���ϰ�
--  �ߺ��� ���� �־ �⺻Ű�� ���ϼ��� Ȯ��
--4. HIRE_DATE�� NULL�� �־ DEFAULT�� ������ ���� �� �ԷµǴ��� Ȯ��

INSERT INTO LSJ_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
VALUES(0,'010-0000-4141','2022-09-29', '000000-1111111', 'LSJ', 'X', 21);

INSERT INTO LSJ_EMP(EID, PHONE, HIRE_DATE, ENO, MARRIAGE, AGE)
VALUES(1,'010-0000-4141','2022-09-29', '000000-111112', 'N', 21);

INSERT INTO LSJ_EMP(PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
VALUES('010-0000-4141','2022-09-29', '000000-1111111', 'LSJ', 'X', 21);

ROLLBACK; -- ���� �������� ���ư�

INSERT INTO LSJ_EMP(EID, ENO, ENAME, MARRIAGE, AGE)
VALUES(1, '000000-1111112', 'LSJ', 'N', 21);
COMMIT; -- Ŀ���� �ϰ��� ���� �������� ���ư� �� ����

-- ���̺� ���� �� ������ ����
CREATE TABLE CP_LSJ_EMP
AS SELECT * FROM EMPLOYEE WHERE ENT_YN = 'Y';

SELECT * FROM CP_LSJ_EMP;
DROP TABLE CP_LSJ_EMP;

-- ���̺� �÷��� �����ؿ���
CREATE TABLE CP_LSJ_EMP
AS SELECT * FROM EMPLOYEE WHERE 1=0;

SELECT * FROM CP_LSJ_EMP;

--------------------------------------------------------------------------------
-- ���̺� ����
-- ALTER TABLE ���̺�� ADD|MODIFY|DROP (�÷��� ��������)

-- �÷� �߰� ADD
ALTER TABLE LSJ_EMP ADD(JOB_CODE CHAR(2));
SELECT * FROM LSJ_EMP;

-- �÷� ���� MODIFY
-- 1. �÷��� Ÿ���� ���̺� �÷����� �ϳ��� ���� ��쿡�� ������ ����
-- 2. �÷��� ũ��� ���ݺ��� ū ũ��θ� ������ ����
-- 3. ���������� ������ ��� �ش� ���������� ��� �����Ͱ� �����ؼ��� �ȵȴ�.
--      NOT NULL, �� NULL�� �����Ͱ� �� �ϳ��� ���� ���� ���� ����
--      UNIQUE, �� �ߺ������Ͱ� ���� ����

ALTER TABLE LSJ_EMP MODIFY(JOB_CODE NOT NULL);
ALTER TABLE LSJ_EMP MODIFY(JOB_CODE CHAR(10));
ALTER TABLE LSJ_EMP MODIFY(JOB_CODE UNIQUE);

-- �÷� ����
ALTER TABLE LSJ_EMP DROP COLUMN JOB_CODE;

--------------------------------------------------------------------------------
-- ���̺� ����
-- DROP
-- �ڽ����̺��� �ִ� ��� ���̺� ���� �Ұ���
-- ���� ���������� �����ϸ� ���̺��� �����ϰ� ���� ���
-- DROP TABLE LSJ_EMP CASCADE CONSTRAINTS;
DROP TABLE LSJ_EMP;













