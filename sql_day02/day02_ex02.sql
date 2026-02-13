SELECT COALESCE(pe.name, '-'),
	   pv.visit_date , 
       COALESCE(piz.name, '-')
from
	(SELECT name, id FROM person ) as pe
FULL JOIN 
	(SELECT visit_date, person_id, pizzeria_id
	FROM person_visits
	where visit_date between ('2022-01-01') and '2022-01-03') as pv 
on pe.id = pv.person_id 
full JOIN
	(SELECT id, name
    from pizzeria) as piz
on pv.pizzeria_id = piz.id

order by 1,2, 3