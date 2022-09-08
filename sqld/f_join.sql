-- *** JOIN ***
-- �ϳ� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ���
-- �������� �ϳ��� RESULT SET���� ���´�.
-- ������ �����ͺ��̽������� �������� �ߺ��� �ּ�ȭ�ϰ� �̻������� �����ϱ� ���� �����͸� ���̺� �˸°� �и��Ͽ� �����ϰ�
-- ���̺��� ���踦 ���� �ʿ��� �����͸� �����Ͽ� ����ϱ� ����.

-- ��� ����� ������ȣ, ������, �μ��ڵ�, �μ����� ��ȸ
select emp_id, emp_name, dept_code, dept_title
from employee e join department d
on(e.dept_code = d.dept_id);

-- 0. CROSS JOIN (�Ⱦ�)
-- Cartensian���� �߻�
-- �� �� ���̺��� �� ��� �ٸ� ���̺��� ��� ���� ���յǴ� ���
select *
from employee cross join department
order by emp_id desc;

-- 1. inner join, outer join(left outer join, right outer join)

-- inner join : �����
-- join ���ǹ��� �ۼ��� ���ǹ��� �����ϴ� row�鸸 join�� ����
-- ������̵�, �����, �����ڵ�, ���޸�
select emp_id, emp_name, e.job_code, job_name
from employee e
inner join job j
on(e.job_code = j.job_code);
-- �� ���̺��� ���ϴ� �÷��� �̸��� ���� ��� using�� ����ؼ� ª�� ����
select emp_id, emp_name, job_code, job_name
from employee e
inner join job j
using(job_code);
-- n���� ���̺� �����ϱ�
-- �����ȣ, �����, �μ��ڵ�, �μ���, �μ�������
select emp_id, emp_name, dept_code, dept_title, local_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on(d.location_id = l.local_code);

-- SELF JOIN
-- �����, �μ��ڵ�, �Ŵ��� ���̵�, �Ŵ��� �̸�
select e.emp_name, e.dept_code, e.manager_id, m.emp_name
from employee e
inner join employee m on(e.manager_id = m.emp_id);

-- OUTER JOIN
-- LEFT OUTER JOIN
select *
from job 
left join employee using(job_code)
order by job_code;

-- RIGHT OUTER JOIN
select *
from job 
right join employee using(job_code)
order by job_code;

-- FULL OUTER JOIN
select *
from job 
full join employee using(job_code)
order by job_code;

-- �̸��� '��'�� ���� ����� ���ID, ����̸�, ���޸��� ����ϼ���
select emp_name, emp_id, emp_name, job_name
from employee e
inner join job j using(job_code)
where e.emp_name like '%��%';

-- �μ����� D5, D6 �� ����� �̸�, ���޸�, �μ��ڵ�, �μ����� ����ϼ���
select emp_name, job_name, e.dept_code, dept_title
from employee e
inner join job j using(job_code)
inner join department d on(e.dept_code = d.dept_id)
where e.dept_code in('D5','D6');

--�μ��� ��ġ�� ������ �ѱ��̳� �Ϻ��� �����
--�̸�, �μ���, ������, �������� ����Ͻÿ�
-- employee, department, location, national
select emp_name, dept_title, local_name, national_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on(d.location_id = l.local_code)
inner join national n using(national_code)
where national_name in('�ѱ�','�Ϻ�');









