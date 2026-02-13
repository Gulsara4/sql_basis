SELECT pizza_name
from menu
INTERSECT
select pizza_name
from menu
order by pizza_name desc