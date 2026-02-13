create unique index idx_person_order_order_date on person_order(person_id, menu_id)
where order_date='2022-01-01';
set ENABLE_seqscan=off;
EXPLAIN ANALYsE
SELECT *
FROM person_order
WHERE person_id = 1 AND menu_id = 2 AND order_date = '2022-01-01';