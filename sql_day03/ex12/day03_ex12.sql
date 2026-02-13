with c1 as (SELECT max (id ) as pop  from person_order),
 c2 as (select menu.id as pop1 from menu where menu.pizza_name='greek pizza')
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (select pop from c1) +person.id, person.id, (select pop1 from c2), '2022-02-25'
FROM person

