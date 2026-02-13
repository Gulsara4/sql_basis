select person.name, menu.pizza_name, menu.price, to_char(
price*((100-person_discounts.discount)/100), 'FM999999999.000') as discount_price, pizzeria.name
from person_order
inner join menu on menu.id=person_order.menu_id
 inner join person on person.id= person_order.person_id
inner  join person_discounts on person_discounts.person_id =person_order.person_id
inner  join pizzeria on pizzeria.id= menu.pizzeria_id
order by 1