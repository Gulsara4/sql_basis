select  address, pizzeria.name, count(*)  from person_order
join menu on menu.id= person_order.menu_id
join person on person.id=person_order.person_id
join pizzeria on pizzeria.id= menu.pizzeria_id
group by person_id, address, pizzeria.name
order by address, pizzeria.name
