CREATE INDEX idx_1 ON pizzeria (rating);
set ENABLE_seqscan=off; --0.451 -366 with 1 ind  witchout any rating 431
EXPLAIN ANALYsE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;