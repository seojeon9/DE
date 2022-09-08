-- Group by
-- 특정 컬럼을 기준으로 그룹을 만들어 준다.
-- group by의 조건절인 having절에서 그룹함수를 사용할 수 있다.
-- group 함수 : sum, count, avg, max, min

-- group by 컬럼명...
-- 부서별 급여 총액과 평균 급여를 급여
select dept_code, sum(salary), avg(salary)
from employee
group by dept_code;

-- 여러 컬럼을 결합해 그룹을 만들기
-- 부서 내 직급별 급여의 합계와 평균을 구해보자
select dept_code, job_code, sum(salary), avg(salary)
from employee
group by dept_code, job_code
order by dept_code asc, job_code asc;

-- 1. 급여가 300만원 이상인 사원들의 부서별 급여 총액을 구해보자
select dept_code, sum(salary)
from employee
where salary >= 3000000
group by dept_code;

-- 2. 급여의 평균이 300만원 이상인 부서를 조회
select dept_code, avg(salary)
from employee
group by dept_code
having avg(salary) >= 3000000;
-- where절은 실행순서가 더 빠르기 때문에 group by후 having절로 조건을 두어야 한다.

--3. 부서 내 직급 내 연봉 레벨 별 급여의 최고 연봉과 최소 연봉을 구하시오
--  구한 뒤 부서를 기준으로 오름차순 정렬하고 NULL값은 아래에 정렬하시오
select dept_code, job_code, sal_level, max(salary * 12) as "최고 연봉" , min(salary * 12) as "최소 연봉"
from employee 
group by dept_code, job_code, sal_level
order by dept_code nulls last;

--------------------------------------------------------------------------------
-- 집계함수 (ROLLUP, CUBE)
-- ROLLUP : 그룹별 중간 집계를 계산
-- group by rollup(컬럼, 컬럼, 컬럼)
select dept_code, job_code, sal_level, sum(salary)
from employee 
group by rollup(dept_code, job_code, sal_level)
order by dept_code nulls last;

-- CUBE
-- 그룹으로 지정된 모든 조합에 대한 중간집계를 구한다.
select dept_code, job_code, sal_level, sum(salary)
from employee 
group by cube(dept_code, job_code, sal_level)
order by dept_code nulls last;




