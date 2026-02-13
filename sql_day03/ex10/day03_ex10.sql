with c1 as (SELECT id   from menu where menu.pizza_name='sicilian pizza')
INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES (
    ( SELECT max(person_order.id)+1 as id from person_order), 
    (SELECT person.id FROM person WHERE person.name = 'Denis'), 
     (select id from c1),
    '20220224'),



    ((SELECT max(person_order.id)+2 as id from person_order), 
    (SELECT person.id FROM person WHERE person.name = 'Irina'), 
     (select id from c1),
    '20220224'
);
