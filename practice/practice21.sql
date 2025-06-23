--1.
--student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
select
    d.dname,
    s.height MAX_HEIGHT,
    s.name,
    s.height
from student s, department d
where s.deptno1 = d.deptno
    AND (s.deptno1, s.height) IN (select s2.deptno1, max(s2.height)
                                  from student s2
                                  group by s2.deptno1);


--2.
--student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
--해당 학년의 평균 키를 출력 하세요.
--(학년 컬럼으로 오름차순 정렬해서 출력하세요)
select
    s1.grade, s1.name,s1.height, s2.avg_height
from student s1, (select grade, AVG(height) AVG_HEIGHT
                  from student
                  group by grade) s2
where s1.grade = s2.grade
    AND s1.height> s2.AVG_HEIGHT
ORDER BY grade;


--다중컬럼, 서브쿼리에서 계산 후 비교, 순위 각각으로 풀어보기?






