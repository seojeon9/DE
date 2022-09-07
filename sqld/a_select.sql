-- Oracle 타입
-- 문자열   : char(고정길이), varchar2(가변길이)
-- 숫자    : number
-- 날짜    : date


-- select
-- 테이블에서 원하는 데이터를 조회하는 구문
-- select문의 결과물 -> result set
-- 작성법  : select 컬럼명... from 테이블명 where 조건식

-- 1. job테이블에서 직접 이름 조회
select job_name from job;

-- 2. employee 테이블의 사번, 이름, 급여
select emp_no, emp_name, salary from employee;

-- 3.employee 테이블의 모든 컬럼 조회
select * from employee;

------------------------------------------------------------------------
-- ***컬럼간 산술 연산***
-- 산술연산자 : +, -, *, /
-- 1. employee 테이블에 직원의 이름과 연볼을 조회(급여 * 12)
-- **컬럼 별칭**
-- 형식 : 컬럼 as 별칭, 컬럼 별칭, 컬럼 as "별칭", 컬럼 "별칭"
-- 만약 별칭에 띄어쓰기, 특수문자 포함될 경우 "" 필수
select emp_name, salary * 12 as 연봉 from employee;


-- ***리터럴 컬럼***
-- 구문에서 직접 사용되는 값, select 절에 사용할 경우 마치 테이블에 존재하는 데이터인 것 마냥 result set에 포함된다.
-- 1. employee 테이블에서 직원의 전화번호, 사원명, 급여, 단위를 조회
select phone, emp_name, salary, '원' from employee;

-- ***문자열 결합연산자***
-- 컬럼과 리터럴을 결합하거나, 컬럼과 컬럼을 결합할 경우 사용하는 연산자
-- ||
select emp_name || '씨의 월급은 ' || salary || '원 입니다.' from employee;

-- ***distinct***
-- result set에서 중복된 row를 제거하고자 할 때 사용
select DISTINCT job_code from employee;

-- case when 조건식 then 결과값
--      when 조건식 then 결과값
--      else 결과값
-- end

-- 직원의 급여를 인상하고자한다.
-- 직급코드가 J7인 직원은 급여의 10%를 인상하고
-- 직급코드가 J8인 직원은 급여의 15%를 인상하고
-- 직급코드가 J5인 직원은 급여의 20%를 인상하며
-- 나머지 직급의 직원은 급여의 5%만 인상한다고 하였을 때
-- 인상된 급여를 직원명, 직급코드, 급여와 함께 조회하시오.
select emp_name, job_code, salary,
case when job_code = 'J7' then salary * 1.1
    when job_code = 'J8' then salary * 1.15
    when job_code = 'J5' then salary * 1.2
    else salary * 1.05
end 인상급여
from employee;













