-- where절
-- 테이블에서 원하는 조건의 row만을 조회하기 위해 작성하는 조건문
-- *** 비교연산자, 논리연산자 ***
-- 비교연산자 : <, >, <=. >=, =
--  같지 않다 : !=, ^=, <>
-- 논리연산자 : and, or, not

-- 1. employee 테이블에서 부서코드가 'D9'인 직원의 이름, 부서코드 조회
select emp_name, dept_code from employee
where dept_code = 'D9';

-- 2. EMPLOYEE 테이블에서 급여가 4000000이상인 직원들의 이름과 연봉을 조회
select emp_name, salary * 12 연봉 from employee
where salary >= 4000000;

-- *** and, or ***
-- 1. 부서코드가 'D6' 이고 급여를 200만원 보다 많이 받는 직원의 이름, 부서코드, 급여를 조회
select emp_name, dept_code, salary from employee
where dept_code = 'D6' and salary >= 2000000;

-- 2. EMPLOYEE 테이블에서 월급이 400만원 이상이고 JOB코드가 J2인 사원의 모든 컬럼을 조회
select * from employee
where salary >= 4000000 and job_code='J2';

--3.EMPLOYEE 테이블에서 부서코드가 D9이거나 D5인 사원 중 고용일이 01/08/01 보다 빠른 사원의 이름, 부서코드, 고용일 조회
-- HIRE_DATE < '01/08/01' 이렇게 작성하셔도 날짜비교 됩니다.
select emp_name, dept_code, hire_date from employee
where (dept_code='D9' or dept_code='D5') and hire_date < '01/08/01';

-- *** LIKE ***
-- 컬럼의 문자값이 LIKE절에 지정한 패턴을 만족시키면 TRUE, 아니면 FALSE
-- 컬럼명 LIKE '패턴'
-- '%', '_'
-- '%' : '글자%' ('글자'로 시작하는 문자열)
--      : '%글자' ('글자'로 끝나는 문자열)
--      : '%글자%' ('글자'를 포함하는 문자열)

-- EMPLOYEE 테이블에서 성이 전씨인 사원의 사번, 이름, 고용일 조회
select emp_id, emp_name, hire_date
from employee
where emp_name like '전%';

-- EMPLOYEE 테이블에서 이름에 '이'가 들어가고 부서코드가 'D5'인 사원을 조회
select *
from employee
where emp_name like '%이%' and dept_code = 'D5';

-- EMPLOYEE 테이블에서 이름이 '연'으로 끝나는 사원의 모든 정보를 조회
select *
from employee
where emp_name like '%연';

-- 문자 자리수 지정 : '_' (한칸), '__' (두칸)
-- employee 테이블에서 전화번호의 4번째 자리부터 9로 시작하는 사원의 사번, 이름, 전화번호를 조회
select emp_id, emp_name, phone
from employee
--where phone like '___9%';
where phone like '%9___';

-- escape
-- 이메일 중 '_' 의 앞 글자가 3자리인 이메일 주소를 가진 사원의 모든 정보 조회
-- EX) SUN_DI@KH.OR.KR
-- 이미 와일드카드 문자로 등록된 특수문자를 사용해서 검색해야할 경우
-- 해당 특수문자 앞에 임의의 특수문자를 사용하고 ESCAPE OPTION으로 등록
select * from employee
where email like '___$_%' escape '$';

-- *** in ***
-- in 목록에 일치하는 값이 있으면 true 없으면 false
-- 컬럼명 in(값, 값, 값,..) 

--D6부서와 D8부서의 사원들의 모든 정보를 조회
select * from employee
where dept_code in('D6','D8');

-- *** between and ***
-- 컬럼명 between 하한값 and 상한값
-- 4. EMPLOYEE 테이블에서 월급이 350만원 이상이고 600만원 이하인 직원의 모든 정보를 조회
select * from employee
where salary between 3500000 and 6000000;

-- *** is null ***
-- 컬럼값이 null인 경우 True를 반환
-- 보너스를 받지 않는 (BONUS 컬럼의 값이 NULL인) 사원의 모든 정보를 조회
select * from employee where bonus is null;

-- 연산자 우선순위
-- 1. 산술연산자
-- 2. 비교연산자
-- 3. is null, like, in
-- 4. between-and
-- 5. not
-- 6. and
-- 7. or








