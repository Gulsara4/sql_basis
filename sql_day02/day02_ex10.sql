with test as (select name as t1, address as t2 , id as t3 from person )

select DISTINCT name as person_name1, test.t1 as person_name2, address as common_address
from person , test 
where test.t1!=name and test.t2=address
and id>test.t3
order by 1, 2