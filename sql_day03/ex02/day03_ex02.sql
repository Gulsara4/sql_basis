
select  menu.pizza_name, price, pizzeria.name as pizzeria_name

from menu
left join person_order on  menu.id=person_order.menu_id
join pizzeria on pizzeria.id=menu.pizzeria_id
where 
person_order.menu_id ISNULL
order by 1, 2