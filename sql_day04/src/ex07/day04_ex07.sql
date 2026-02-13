insert into person_visits (id, person_id, pizzeria_id, visit_date)
select max(person_visits.id )+1 , 9, 5, '20220108' from person_visits;
REFRESH MATERIALIZED view mv_dmitriy_visits_and_eats;