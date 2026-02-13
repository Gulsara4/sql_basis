select  menu.pizza_name, price, pizzeria.name as pizzeria_name,  visit_date
from person_visits
join menu on menu.pizzeria_id=person_visits.pizzeria_id
join person on person.id=person_visits.person_id
join pizzeria on pizzeria.id=person_visits.pizzeria_id
where price between 800 and 1000 and person.name='Kate'
order by 1, 2, 3