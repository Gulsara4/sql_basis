select * 
from pizzeria
where id not in (select pizzeria_id from person_visits);
SELECT * 
FROM pizzeria p
WHERE NOT EXISTS (
    SELECT 1 
    FROM person_visits pv
    WHERE pv.pizzeria_id = p.id
);
