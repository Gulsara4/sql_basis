select  person.name
from person 
where person.id in 
(select person_id from person_order 
join menu on menu.id =person_order.menu_id
where  menu.pizza_name='pepperoni pizza')
and person.id in 
(select person_id from person_order 
join menu on menu.id =person_order.menu_id
where   menu.pizza_name= 'cheese pizza')
and person.gender='female'
order by 1