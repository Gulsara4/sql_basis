select  visit_date as action_date, person.name as person_name
from person_visits
join person on person.id=person_visits.person_id
intersect
select  order_date,person.name
from person_order
join person on person.id=person_order.person_id
order by action_date, person_name desc