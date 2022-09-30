-- create, alter, drop
-- 데이터무결성 : 데이터의 정확성, 일관성이 유지되는 것
-- 정확성 : 중복이나 누락이 없는 상태
-- 일관성 : 원인과 결과가 연속적으로 보장되는 상태
--create, alter, drop
--데이터무결성 : 데이터의 정확성, 일관성이 유지되는 것
--정확성 : 중복이나 누락이없는 상태
--일관성 : 원인과 결과가 연속적으로 보장되는 상태

create table LSJ_EMP(
    --기본키
    --기본키는 테이블의 각 행을 고유하게 식별하는 역할을 담당한다.
    --테이블 당 하나만 정의 가능하다.
    --기본키는 최소성(NOT NULL) 유일성(UNIQUE)이 만족되어야 한다.
    --만약에 최소성과 유일성이 만족되는 컬럼이 많은 경우
    --대표성을 지니는 컬럼을 기본키로 지정한다.
    --기본키를 지정하면 고유 인덱스가 자동으로 생성이 된다.
    EID NUMBER PRIMARY KEY,

    --컬럼명(속성) 타입 제약조건
    --제약조건 없이 컬럼
    PHONE VARCHAR2(13),
    
    --DEFAULT : 기본 값 지정, 만약 테이블에 ROW를 추가할 때 해당 컬럼값으로 지정된 값이 없으면
    --          NULL 대신 기본값으로 설정한 값을 입력
    HIRE_DATE DATE DEFAULT SYSDATE,
    
    --고유 무결성(UNIQUE) : 테이블의 특정 컬럼값에 대해서 각 ROW의 값들이 서로 달라야한다는 규정
    --                      중복 값 안됨
    ENO CHAR(14) UNIQUE,
    
    --NULL 무결성 : 테이블의 특정 컬럼값이 NULL이 될 수 없음
    ENAME VARCHAR2(30 CHAR) NOT NULL,
    
    --도메인무결성 : 특정 컬럼값이 그 컬럼에 정의된 도메인에 속한 값이어야 한다는 규정
    MARRIAGE CHAR(1) DEFAULT 'N' CHECK(MARRIAGE IN('Y','N')),
    
    AGE NUMBER CHECK(AGE > 20)
    
    --외래키
    --참조무결성 : 기본키와 참조키 간의 관계가 항상 유지 됨
    --CONSTRAIN FOREIGN KEY(컬럼명) REFERENCES 부모테이블(컬럼명)
    --ON UPDATE CASCADE : 부모테이블의 행이 수정되면 자식테이블의 행도 같이 수정(오라클 지원X)
    --ON DELETE CASCADE : 부모테이블의 행이 삭제되면 자식 테이블의 행도 같이 삭제, 
    --                  옵션 지정 안하면 부모테이블 데이터 삭제 불가능
    --ON DELETE SET NULL : 부모테이블의 행이 삭제되면 자식테이블의 행을 NULL로 지정    
);

--제약조건 어겨보기
--1. AGE에 20보다 작은 값을 넣고, MARRIAGE에 'Z'를 넣어서 도메인무결성을 어겨보자!
--2. NOT NULL 이 지정된 컬럼에 NULL을 넣어서 NULL무결성을 어겨보자!
--3. PROMARY KEY로 지정된 E_ID에 NULL값을 넣어서 기본키의 최소성을 확인하고
--  중복된 값도 넣어서 기본키의 유일성도 확인
--4. HIRE_DATE에 NULL을 넣어서 DEFAULT로 지정한 값이 잘 입력되는지 확인

INSERT INTO LSJ_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
VALUES(0,'010-0000-4141','2022-09-29', '000000-1111111', 'LSJ', 'X', 21);

INSERT INTO LSJ_EMP(EID, PHONE, HIRE_DATE, ENO, MARRIAGE, AGE)
VALUES(1,'010-0000-4141','2022-09-29', '000000-111112', 'N', 21);

INSERT INTO LSJ_EMP(PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
VALUES('010-0000-4141','2022-09-29', '000000-1111111', 'LSJ', 'X', 21);

ROLLBACK; -- 이전 시점으로 돌아감

INSERT INTO LSJ_EMP(EID, ENO, ENAME, MARRIAGE, AGE)
VALUES(1, '000000-1111112', 'LSJ', 'N', 21);
COMMIT; -- 커밋을 하고나면 이전 시점으로 돌아갈 수 없음

-- 테이블 생성 시 데이터 복제
CREATE TABLE CP_LSJ_EMP
AS SELECT * FROM EMPLOYEE WHERE ENT_YN = 'Y';

SELECT * FROM CP_LSJ_EMP;
DROP TABLE CP_LSJ_EMP;

-- 테이블 컬럼만 복제해오기
CREATE TABLE CP_LSJ_EMP
AS SELECT * FROM EMPLOYEE WHERE 1=0;

SELECT * FROM CP_LSJ_EMP;

--------------------------------------------------------------------------------
-- 테이블 수정
-- ALTER TABLE 테이블명 ADD|MODIFY|DROP (컬럼명 제약조건)

-- 컬럼 추가 ADD
ALTER TABLE LSJ_EMP ADD(JOB_CODE CHAR(2));
SELECT * FROM LSJ_EMP;

-- 컬럼 수정 MODIFY
-- 1. 컬럼의 타입은 테이블에 컬럼값이 하나도 없는 경우에만 변경이 가능
-- 2. 컬럼의 크기는 지금보다 큰 크기로만 변경이 가능
-- 3. 제약조건을 지정할 경우 해당 제약조건을 어긴 데이터가 존재해서는 안된다.
--      NOT NULL, 단 NULL인 데이터가 단 하나도 없을 때만 지정 가능
--      UNIQUE, 단 중복데이터가 없을 때만

ALTER TABLE LSJ_EMP MODIFY(JOB_CODE NOT NULL);
ALTER TABLE LSJ_EMP MODIFY(JOB_CODE CHAR(10));
ALTER TABLE LSJ_EMP MODIFY(JOB_CODE UNIQUE);

-- 컬럼 삭제
ALTER TABLE LSJ_EMP DROP COLUMN JOB_CODE;

--------------------------------------------------------------------------------
-- 테이블 삭제
-- DROP
-- 자식테이블이 있는 경우 테이블 삭제 불가능
-- 참조 제약조건을 삭제하면 테이블을 삭제하고 싶을 경우
-- DROP TABLE LSJ_EMP CASCADE CONSTRAINTS;
DROP TABLE LSJ_EMP;













