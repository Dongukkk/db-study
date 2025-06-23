--1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
--교수번호화 이름, 학과명을 출력하세요
--(입사일 순으로 오름차순 정렬)
select
    p.profno,
    p.name,
    d.dname
from professor p, department d
where p.deptno = d.deptno
    AND (p.deptno,p.hiredate) IN (select p2.deptno, min(p2.hiredate)
                                 from professor p2
                                 GROUP BY p2.deptno)
ORDER BY p.hiredate;


--2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
--(연봉순으로 오름차순 정렬)
select
    name, position, pay
from emp2
where (position, pay) IN (select position, MAX(pay)
                          from emp2
                          group by position)
order by pay;







