select  pizza_name, pizzeria.name as pizzeria_name, price from menu
inner join pizzeria on pizzeria.id=menu.pizzeria_id
where menu.id in (9,13, 6, 17)
order by 1, 2