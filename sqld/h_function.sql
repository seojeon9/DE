-- CHAR
-- �������� ���ڿ�
-- �÷�ũ�� 100 -> ���̰� 10�� ���ڿ��� �߰��� -> ���ڿ��� ���̰� 100, �ڴ� �������� ä����
-- VARCHAR2
-- �������� ���ڿ�
-- �÷����� 100 -> ���̰� 10�� ���ڿ��� �߰��� -> �÷����� ���̰� 10���� ������

-- 1. ���� ���� �Լ�
-- LENGTH, LENGTHB, SUBSTR, INSTR, CONCAT, REPLACE, TRIM, LPAD, RPAD
-- https://docs.oracle.com/cd/B28359_01/server.111/b28286/functions001.htm#SQLRF51174
SELECT LENGTH('oracle') FROM DUAL; --> DUAL : �������̺�
SELECT LENGTH('����Ŭ') FROM DUAL;
SELECT LENGTHB('oracle') FROM DUAL;
SELECT LENGTHB('oracle') FROM DUAL;

SELECT SUBSTR('PCLASS', 2) FROM DUAL;
SELECT SUBSTR('PCLASS', 2, 3) FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', 4) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL;

SELECT CONCAT('A','B') FROM DUAL;
SELECT 'A'||'B' FROM DUAL;

SELECT REPLACE('����� ������ ������', '������') FROM DUAL;
SELECT REPLACE('����� ������ ������', '������', '���ﵿ') FROM DUAL;

SELECT TRIM('    MULTICAMPUS                  ') FROM DUAL;
SELECT TRIM(LEADING 'M' FROM 'MULTICAMPUS') FROM DUAL;
SELECT TRIM(TRAILING 'S' FROM 'MULTICAMPUS') FROM DUAL;
SELECT TRIM(BOTH 'M' FROM 'MULTICAMPUSM') FROM DUAL;

SELECT LPAD(EMAIL, 20) FROM EMPLOYEE;
SELECT LPAD(EMAIL, 20, '#') FROM EMPLOYEE;
SELECT RPAD(EMAIL, 20, '#') FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ������ �ֹι�ȣ�� ��ȸ�ϼ���
-- �� �ֹι�ȣ�� ������ϰ� '-' ������ ���̰� �ϰ� ������ �ڸ��� ���ڵ��� *�� �ٲپ� ����ϼ���.
SELECT EMP_NAME, CONCAT(SUBSTR(EMP_NO, 1, 7),'*******') EMP_NO FROM EMPLOYEE;
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 7), 14 ,'*') EMP_NO FROM EMPLOYEE;
SELECT EMP_NAME, REPLACE(EMP_NO, SUBSTR(EMP_NO, 8),'*******') EMP_NO FROM EMPLOYEE;

----------------------------------------------------------------------------------------
-- 2. ���� ó�� �Լ�
-- ABS, MOD, ROUND, FLOOR, TRUNC, CEIL


----------------------------------------------------------------------------------------
-- 3. ��¥ ó�� �Լ�
-- SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, EXTRACT
-- SYSDATE : �ý��ۿ� ����Ǿ� �ִ� ���� ��¥
SELECT SYSDATE FROM DUAL;
-- SYSTIMESTAMP - GMT : ǥ�ؽ�
SELECT SYSTIMESTAMP FROM DUAL;
-- LOCALTIMESTAMP
SELECT LOCALTIMESTAMP FROM DUAL;

-- MONTHS_BETWEEN
-- ������� �ٹ��������� ���غ����� ����
SELECT EMP_NAME, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS �ٹ������� FROM EMPLOYEE
ORDER BY HIRE_DATE ASC;

-- ADD_MONTHS
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 12) FROM EMPLOYEE;

-- EXTRACT
SELECT EMP_NAME,
EXTRACT(YEAR FROM HIRE_DATE),
EXTRACT(MONTH FROM HIRE_DATE),
EXTRACT(DAY FROM HIRE_DATE)
FROM EMPLOYEE;

--------------------------------------------------------------------------------
-- 4. ����ȯ �Լ�
-- TO_CHAR
-- TO_DATE
SELECT TO_CHAR(SYSDATE, 'YEAR') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY"��" MONTH') FROM DUAL;
SELECT TO_CHAR(123456789, '9,999,999,999') FROM DUAL;
SELECT TO_CHAR(10000, '$99999') FROM DUAL;
SELECT TO_CHAR(10000, 'L99,999') FROM DUAL;

-- 5. NULLó�� �Լ�
-- NULL : ���� �������� ���� ��
-- NULL�� ��������̳� �񱳿����� ����� NULL
-- NULL�� ������
SELECT * FROM EMPLOYEE
WHERE BONUS > NULL OR EMP_ID = 202;

-- NVL, NVL2, NULLIF
-- NVL
SELECT EMP_NAME, BONUS, NVL(BONUS,0) FROM EMPLOYEE;
SELECT EMP_NAME, BONUS, NVL(DEPT_CODE,'���Ҽ�') FROM EMPLOYEE;

-- NVL2
-- EMPLOYEE ���̺��� ���ʽ��� NULL�� ������ 0.5 �ƴ� ������ 0.1
SELECT EMP_NAME, BONUS, NVL2(BONUS, 0.5, 0.1) FROM EMPLOYEE;

-- NULLIF
SELECT NULLIF('1234','123') FROM DUAL;
SELECT NULLIF('1234','1234') FROM DUAL;

--------------------------------------------------------------------------------
-- 6. ���� �Լ� DECODE
-- CASE WHEN THEN ����� �ϴ� �Լ�
-- �ֹε�Ϲ�ȣ ���ڸ��� ���ڸ��� Ȧ���̸� ����, ¦���̸� ���ڷ� ǥ���Ͻÿ�
SELECT EMP_NAME, EMP_NO,
DECODE(MOD(SUBSTR(EMP_NO, 8, 1),2),1,'��',0,'��')
FROM EMPLOYEE;

