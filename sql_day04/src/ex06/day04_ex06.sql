create MATERIALIZED VIEW mv_dmitriy_visits_and_eats as (select pizzeria.name  as pizzeria_name from person_visits
join person on person.id=person_visits.person_id
join pizzeria on pizzeria.id=person_visits.pizzeria_id
join menu on menu.pizzeria_id=person_visits.pizzeria_id
where visit_date='20220108' and price <800   and person.name='Dmitriy');
