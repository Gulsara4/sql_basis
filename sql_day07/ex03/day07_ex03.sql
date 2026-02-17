with p1 as (SELECT pizzeria_id, COUNT(pizzeria_id) as cp from person_visits
--order by pizzeria_id
group by pizzeria_id
order by pizzeria_id),
p2 as (
select pizzeria_id, count(pizzeria_id) as cp  from person_order
join menu on menu.pizzeria_id=person_order.menu_id
group by pizzeria_id
order by pizzeria_id)
SELECT 
    pizzeria.name as name ,
    COALESCE(p1.cp, 0) + COALESCE(p2.cp, 0) AS total_count
FROM p1
LEFT JOIN p2 ON p1.pizzeria_id = p2.pizzeria_id
join pizzeria on pizzeria.id=p1.pizzeria_id

ORDER by total_count desc,  name;
