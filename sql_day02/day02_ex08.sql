select distinct person.name
from person 
join person_order as po on po.menu_id in (9, 13, 6, 17, 2, 14)
where person.gender='male' and address in ('Moscow', 'Samara')
order by 1 desc 