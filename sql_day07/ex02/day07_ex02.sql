with p1 as (
select pizzeria.name, count(*), 'visit' as action_type from person_visits
join pizzeria on pizzeria.id= person_visits.pizzeria_id
group by  pizzeria.name
order by 2 
limit 3),
  
p2 as (

select pizzeria.name, count(*), 'order' as action_type  from person_order 
join menu on menu.id =person_order.menu_id
join pizzeria on pizzeria.id=menu.pizzeria_id
group by pizzeria.name
 order by 2 desc
 limit 3
)
select * from p1
UNION all
select * from p2
order by 3  asc, 2 desc;
