with c1 as (SELECT max(person_visits.id) as id from person_visits)
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    ( SELECT max(person_visits.id)+1 as id from person_visits), 
    (SELECT person.id FROM person WHERE person.name = 'Denis'), 
    (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
    '20220224'
);

-- Второй запрос, после выполнения первого
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT max(person_visits.id)+1 as id from person_visits), 
    (SELECT person.id FROM person WHERE person.name = 'Irina'), 
    (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
    '20220224'
);
