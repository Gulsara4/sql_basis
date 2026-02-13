
select v_persons_female.name from v_persons_female 
union 
select v_persons_male.name
from v_persons_male
order by name