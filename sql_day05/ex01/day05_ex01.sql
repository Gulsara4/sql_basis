set ENABLE_seqscan=off;
EXPLAIN ANALYSE
select distinct pizza_name, name as pizzeria_name  from menu
join pizzeria on pizzeria.id = menu.pizzeria_id
ORDER BY 1