select pizzeria.name, rating
from pizzeria,
(select Distinct pizzeria.id as pop, person_visits.pizzeria_id  as test
from pizzeria
Left  join person_visits on person_visits.pizzeria_id=pizzeria.id 
order by pizzeria.id) 
where pop=pizzeria.id and test isnull