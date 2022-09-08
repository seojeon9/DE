-- *** JOIN ***
-- 하나 이상의 테이블에서 데이터를 조회하기 위해 사용
-- 수행결과는 하나의 RESULT SET으로 나온다.
-- 관계형 데이터베이스에서는 데이터의 중복을 최소화하고 이상현상을 방지하기 위해 데이터를 테이블에 알맞게 분리하여 저장하고
-- 테이블간의 관계를 통해 필요한 데이터를 조합하여 사용하기 때문.

-- 모든 사원의 직원번호, 직원명, 부서코드, 부서명을 조회
select emp_id, emp_name, dept_code, dept_title
from employee e join department d
on(e.dept_code = d.dept_id);

-- 0. CROSS JOIN (안씀)
-- Cartensian곱이 발생
-- 한 쪽 테이블의 한 행과 다른 테이블의 모든 행이 결합되는 방식
select *
from employee cross join department
order by emp_id desc;

-- 1. inner join, outer join(left outer join, right outer join)

-- inner join : 등가조인
-- join 조건문을 작성해 조건문에 부합하는 row들만 join을 수행
-- 사원아이디, 사원명, 직급코드, 직급명
select emp_id, emp_name, e.job_code, job_name
from employee e
inner join job j
on(e.job_code = j.job_code);
-- 두 테이블의 비교하는 컬럼의 이름이 같은 경우 using을 사용해서 짧게 가능
select emp_id, emp_name, job_code, job_name
from employee e
inner join job j
using(job_code);
-- n개의 테이블 결합하기
-- 사원번호, 사원명, 부서코드, 부서명, 부서지역명
select emp_id, emp_name, dept_code, dept_title, local_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on(d.location_id = l.local_code);

-- SELF JOIN
-- 사원명, 부서코드, 매니저 아이디, 매니저 이름
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

-- 이름에 '형'이 들어가는 사원의 사원ID, 사원이름, 직급명을 출력하세요
select emp_name, emp_id, emp_name, job_name
from employee e
inner join job j using(job_code)
where e.emp_name like '%형%';

-- 부서명이 D5, D6 인 사원의 이름, 직급명, 부서코드, 부서명을 출력하세요
select emp_name, job_name, e.dept_code, dept_title
from employee e
inner join job j using(job_code)
inner join department d on(e.dept_code = d.dept_id)
where e.dept_code in('D5','D6');

--부서가 위치한 국가가 한국이나 일본인 사원의
--이름, 부서명, 지역명, 국가명을 출력하시오
-- employee, department, location, national
select emp_name, dept_title, local_name, national_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on(d.location_id = l.local_code)
inner join national n using(national_code)
where national_name in('한국','일본');









