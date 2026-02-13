select object_name
from (
    select name as object_name, 1 as sort_order
    from person
    union all
    select pizza_name as object_name, 2 as sort_order
    from menu
) as combined
order by sort_order, object_name;
