-- *** order by ***
-- ����� ������ �� ����ϴ� ����
-- select���� ���� �������� �ۼ�, ��������� ���� ������
-- �ؼ����� : FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY

-- ORDER BY �ۼ���
-- ORDER BY �÷��� ASC : �÷����� �������� ����, ���� ����� �÷��� �ϳ� ���̶�� ���� ����
-- ORDER BY �÷��� DESC : �÷����� �������� ����, ���� �Ұ�
-- NULLS FIRST : �÷����� NULL�� ���� ��� �տ� ����
-- NULLS LAST : �÷� ���� NULL�� ���� ��� �ڿ� ����

-- ����� �̸�, �޿�, �μ��ڵ�, ���ʽ�, ���������� ��ȸ
select emp_name, salary, dept_code, bonus, sal_level
from employee
-- �̸����� �������� ����
--order by emp_name desc;
-- �������� �������� ����
--order by salary;
-- select���� ������ �̷��� result set�� �ι�° �÷����� �������� ����
--order by 2 desc;
-- ���������� �������� ����, ���������� ���ٸ� ������ ������� �������� ����
--order by sal_level ASC, salary desc;
-- ���ʽ��� �������� �������� ����, �÷����� NULL�� ������ NULL�� �������� ����
--order by bonus asc nulls first;
order by bonus asc nulls last;



