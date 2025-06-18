--emp 전체 sal 급여 평균
select AVG(sal) 평균급여
from emp;

--emp 30번부서사람들 평균급여
select AVG(sal) "30번부서평균급여"
from emp
where deptno=30;

--emp 각부서별 평균 급여
select deptno 부서, AVG(sal) 평균급여
from emp
group by deptno;

--emp 각부서별 인원과 평균 급여
select 
    deptno 부서,
    COUNT(empno) 인원수,
--    TO_CHAR(AVG(sal), '9999.99') 평균급여
    ROUND(AVG(sal), 2) 평균급여
from emp
group by deptno;

--emp 각 직업별 평균 급여
select job 직업, AVG(sal)평균급여
from emp
group by job;

--emp 각 직업별 가장 높은 급여 얼마?
select job 직업, MAX(sal) 최고급여
from emp
group by job;

--emp 각 부서별 가장 높은 급여 얼마?
select deptno 부서, MAX(sal) 최고급여
from emp
group by deptno;