-- select person_id, pizzeria_id, person.name, pizzeria.name
-- from person_visits, person, pizzeria
-- where person_visits.person_id=person.id and 
-- pizzeria_id=pizzeria.id
-- and visit_date>='20220107' and visit_date<='20220109' 




select distinct person_name,  pizzeria_name
from person_visits,
(select pizzeria.name as pizzeria_name, person.name as person_name
 from pizzeria, person_visits, person
 where pizzeria.id = person_visits.pizzeria_id and person.id=person_visits.person_id AND
 visit_date>='20220107' and visit_date<='20220109'
)


order by person_name, pizzeria_name desc