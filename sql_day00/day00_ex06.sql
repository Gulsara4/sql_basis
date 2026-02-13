

select (select name from person where id= person_id),
(select  
 case 
 when name='Denis' then false else true
 end
 from person where id= person_id) as check_name
from person_order
where (menu_id=13 or menu_id=14 or menu_id=18) and order_date='20220107'


