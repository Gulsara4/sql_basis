select pizzeria.name, count(pizzeria_id) as count_of_orders,
round(AVG(price),2) as average_price, Max(price) as max_price ,MIN(price) as min_price
from person_order
join menu on menu.id =menu_id
join pizzeria on pizzeria.id= menu.pizzeria_id
group by pizzeria.name
order by 1
