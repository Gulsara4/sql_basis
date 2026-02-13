select pizzeria.name
from person_visits
 join menu on menu.pizzeria_id=person_visits.pizzeria_id
 join pizzeria on person_visits.pizzeria_id=pizzeria.id
where person_visits.person_id=9 and visit_date='20220108' and price<800