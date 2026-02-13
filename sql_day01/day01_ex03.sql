select  visit_date as action_date, person_id
from person_visits
intersect
select  order_date, person_id
from person_order
order by action_date, person_id desc