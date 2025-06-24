--emp2 dept2 테이블을 참고하여,
--
--'AL Pacino'와 "같은 지역"에서
--근무하는 직원들의 평균 연봉보다
--많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.
select 
    e.empno, e.name, e.deptno, d.dname, d.area, e.pay
from emp2 e, dept2 d
where e.deptno = d.dcode
 AND e.pay > (
                select AVG(pay)
                from ( select *
                       from emp2 e1, dept2 d1
                       where e1.deptno = d1.dcode)
                where area = (select d2.area 
                                from emp2 e2, dept2 d2
                                where e2.deptno = d2.dcode
                                AND e2.name=  'AL Pacino'
                                ));

select * 
from emp2 e, dept2 d
where e.deptno = d.dcode;