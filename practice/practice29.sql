
--테이블 생성시, product_quiz 테이블명으로 생성

CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

select TRUNC(price/10000)*10000 PRICE_GROUP, COUNT(*) PRODUCTS
from product_quiz
group by TRUNC(price/10000)
order by price_group;

select TRUNC(price,-4) PRICE_GROUP, COUNT(*) PRODUCTS
from product_quiz
group by TRUNC(price,-4)
order by price_group;


-- 추가방법 1
select 0 PRICE_GROUP, COUNT(*) PRODUCTS
from product_quiz
where price BETWEEN 0 AND 9999
UNION ALL
select 10000, COUNT(*)
from product_quiz
where price BETWEEN 10000 AND 19999
UNION ALL
select 20000, COUNT(*)
from product_quiz
where price BETWEEN 20000 AND 29999
UNION ALL
select 30000, COUNT(*)
from product_quiz
where price BETWEEN 30000 AND 39999;

-- 추가방법 2
select
    CASE 
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END PRICE_GROUP,
    count (*) PRODUCTS
from product_quiz
GROUP BY 
    CASE 
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END
order by PRICE_GROUP;

-- 추가방법 3
select price PRICE_GROUP, COUNT(*) products
FROM(
    select
        CASE 
            WHEN price BETWEEN 0 AND 9999 THEN 0
            WHEN price BETWEEN 10000 AND 19999 THEN 10000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
        END PRICE
    from product_quiz
)
group by price
order by PRICE_GROUP;