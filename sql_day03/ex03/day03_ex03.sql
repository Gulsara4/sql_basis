WITH pizzeria_visits AS (
    SELECT pizzeria.id AS pizzeria_id,
           pizzeria.name AS pizzeria_name,
           person.gender,
           COUNT(person_visits.pizzeria_id) AS visit_count
    FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.id, pizzeria.name, person.gender
)
SELECT pizzeria_name
      
FROM (
    SELECT pizzeria_name,
           SUM(CASE WHEN gender = 'male' THEN visit_count ELSE 0 END) AS male_visits,
           SUM(CASE WHEN gender = 'female' THEN visit_count ELSE 0 END) AS female_visits
    FROM pizzeria_visits
    GROUP BY pizzeria_name
) AS visit_comparison
WHERE male_visits != female_visits
ORDER BY pizzeria_name;
