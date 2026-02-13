with pp as (select distinct menu.id as o from menu)
select pp.o as menu_id
from person_order
RIGHT join pp on  pp.o=person_order.menu_id
where person_order.menu_id ISNULL
order by 1