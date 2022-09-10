--1. �̸��� '��'�� ���� ����� ���ID, ����̸�, �������� ����ϼ��� 
select emp_name, emp_id, emp_name, job_name
from employee e
inner join job j using(job_code)
where e.emp_name like '%��%';

--2. �μ����� D5, D6 �� ����� �̸�, ������, �μ��ڵ�, �μ����� ����ϼ���
select emp_name, job_name, e.dept_code, dept_title
from employee e
inner join job j using(job_code)
inner join department d on(e.dept_code = d.dept_id)
where e.dept_code in('D5','D6');

--3. �μ��� ��ġ�� ������ �ѱ��̳� �Ϻ��� �����
--�̸�, �μ���, ������, �������� ����Ͻÿ�
-- employee, department, location, national 
select emp_name, dept_title, local_name, national_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on(d.location_id = l.local_code)
inner join national n using(national_code)
where national_name in('�ѱ�','�Ϻ�');


--4. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ ��ȸ�Ͻÿ�
select emp_name, phone
from employee
where not phone like '010%';

--5. ���, �����, �޿�, ���� �÷��� ����Ͻÿ�
--���� �÷���
--�޿��� 500���� �̻��̸� '���'
--�޿��� 300~500�����̸� '�߱�'
--�� ���ϴ� '�ʱ�'���� ���ó�� �ϵ��� �ۼ��Ͻÿ�
select emp_id, emp_name, salary,
case when salary >= 5000000 then '���'
    when salary >= 3000000 then '�߱�'
    else '�ʱ�'
end ����
from employee;


--6. EMPLOYEE ���̺��� �����ּ� '_'�� ���� 4���� �̸鼭
--DEPT_CODE�� D9 �Ǵ� D6�̰�
--������� 90/01/01 ~ 00/12/01 �̸鼭 �޿��� 270���� �̻��� ����� ��ü ������ ��ȸ�Ͻÿ�
select *
from employee
where email like '____^_%' escape '^'
    and dept_code in('D9','D6')
    and hire_date between '90/01/01' and '00/12/01'
    and salary >= 2700000;


--7. �μ��� �׷��� �޿��հ谡 9�鸸���� �ʰ��ϴ� �μ��� �μ��ڵ�� �޿��հ踦 ��ȸ�ϰ�
--�μ��ڵ� ������������ �����Ͻÿ�
select dept_code, sum(salary) as �޿��հ�
from employee
group by dept_code
having sum(salary) > 9000000
order by dept_code desc;


--8. 70��� ���̸鼭 ������ �����̰� ���� ������ �����
--�̸�, �ֹε�Ϲ�ȣ, �μ���, �������� ����ϼ���.
select emp_name, emp_no, dept_title, job_name
from employee e
join department d on(e.dept_code = d.dept_id)
join job j using(job_code)
where emp_no like '7%' 
    and emp_no like '_______2%'
    and emp_name like '��%';


--9. ����� ����� ������� ���� ����� ���ڸ� ����ϼ���
select ent_yn, count(ent_yn)
from employee
group by ent_yn;


--10. �ڽ��� �Ŵ������� �޿��� �� ���� ����� �̸�, �μ�, �޿�, �Ŵ��� �̸�, �Ŵ��� �μ�, �Ŵ��� �޿��� ��ȸ�Ͻÿ�
select e.emp_name, ed.dept_title, e.salary, m.emp_name, md.dept_title, m.salary
from employee e
join employee m on(e.manager_id = m.emp_id)
join department ed on (e.dept_code = ed.dept_id)
join department md on (m.dept_code = md.dept_id)
where e.salary > m.salary;

 
--11. �μ��� ��ġ�� ������ ��� �޿��� ��ȸ�Ͻÿ�, 
--���� �ش� ������ �ִ� �μ��� �������� �ʴ��� ���� ������ ��µǵ��� �ۼ��Ͻÿ�
select national_name, sum(salary)
from national n
left outer join location l using(national_code)
left outer join department d on (l.local_code = d.location_id)
left outer join employee e on(e.dept_code = d.dept_id)
group by national_name;


