-- 1. 
select department_name as �а���, category as �迭
from tb_department;

-- 2. 
select department_name || '�� ������ ' || capacity || '�Դϴ�.' as "�а��� ����"
from tb_department;

-- 3.
select student_name 
from tb_student
where department_no = '001' and absence_yn = 'Y' and student_ssn like '_______2______';

-- 4.
select student_name 
from tb_student
where student_no in ('A513079','A513090','A513091','A513110','A513119');

-- 5.
select department_name, category
from tb_department
where capacity between 20 and 30;

-- 6.
select professor_name
from tb_professor
where department_no is null ;

-- 7.
select student_name
from tb_student
where department_no is null ;

-- 8.
select class_no
from tb_class
where PREATTENDING_CLASS_NO is not null;

-- 9.
select distinct(category)
from tb_department;

-- 10.
select student_no, student_name, student_ssn
from tb_student
where entrance_date like '02%' 
    and absence_yn = 'N'
    and student_address like '%����%';
   







