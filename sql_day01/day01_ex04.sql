select  person_id
from person_order
where order_date='20220107' 
Except all
select   person_id
from person_visits
where visit_date='20220107';

