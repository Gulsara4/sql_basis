select person.name, count(*) as count_of_visits
from person_visits 
JOIN person on person.id=person_visits.person_id
group by person.name
HAVING COUNT(*) > 3
