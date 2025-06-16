
--연결 연산자 연습 문제 1
select name || '''s ID : '|| id ||', WEIGHT is '||weight||'Kg' AS "ID AND WEIGHT" from student;

--연결 연산자 연습 문제 2
select ENAME || '('|| JOB ||')'||', '||ENAME || ''''|| JOB ||'''' AS "NAME AND JOB" from emp;

--연결 연산자 연습 문제 3
select ENAME || '''s sal is $' || SAL AS "Name and Sal" from emp;