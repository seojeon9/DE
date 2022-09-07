-- Oracle Ÿ��
-- ���ڿ�   : char(��������), varchar2(��������)
-- ����    : number
-- ��¥    : date


-- select
-- ���̺��� ���ϴ� �����͸� ��ȸ�ϴ� ����
-- select���� ����� -> result set
-- �ۼ���  : select �÷���... from ���̺�� where ���ǽ�

-- 1. job���̺��� ���� �̸� ��ȸ
select job_name from job;

-- 2. employee ���̺��� ���, �̸�, �޿�
select emp_no, emp_name, salary from employee;

-- 3.employee ���̺��� ��� �÷� ��ȸ
select * from employee;

------------------------------------------------------------------------
-- ***�÷��� ��� ����***
-- ��������� : +, -, *, /
-- 1. employee ���̺� ������ �̸��� ������ ��ȸ(�޿� * 12)
-- **�÷� ��Ī**
-- ���� : �÷� as ��Ī, �÷� ��Ī, �÷� as "��Ī", �÷� "��Ī"
-- ���� ��Ī�� ����, Ư������ ���Ե� ��� "" �ʼ�
select emp_name, salary * 12 as ���� from employee;


-- ***���ͷ� �÷�***
-- �������� ���� ���Ǵ� ��, select ���� ����� ��� ��ġ ���̺� �����ϴ� �������� �� ���� result set�� ���Եȴ�.
-- 1. employee ���̺��� ������ ��ȭ��ȣ, �����, �޿�, ������ ��ȸ
select phone, emp_name, salary, '��' from employee;

-- ***���ڿ� ���տ�����***
-- �÷��� ���ͷ��� �����ϰų�, �÷��� �÷��� ������ ��� ����ϴ� ������
-- ||
select emp_name || '���� ������ ' || salary || '�� �Դϴ�.' from employee;

-- ***distinct***
-- result set���� �ߺ��� row�� �����ϰ��� �� �� ���
select DISTINCT job_code from employee;

-- case when ���ǽ� then �����
--      when ���ǽ� then �����
--      else �����
-- end

-- ������ �޿��� �λ��ϰ����Ѵ�.
-- �����ڵ尡 J7�� ������ �޿��� 10%�� �λ��ϰ�
-- �����ڵ尡 J8�� ������ �޿��� 15%�� �λ��ϰ�
-- �����ڵ尡 J5�� ������ �޿��� 20%�� �λ��ϸ�
-- ������ ������ ������ �޿��� 5%�� �λ��Ѵٰ� �Ͽ��� ��
-- �λ�� �޿��� ������, �����ڵ�, �޿��� �Բ� ��ȸ�Ͻÿ�.
select emp_name, job_code, salary,
case when job_code = 'J7' then salary * 1.1
    when job_code = 'J8' then salary * 1.15
    when job_code = 'J5' then salary * 1.2
    else salary * 1.05
end �λ�޿�
from employee;













