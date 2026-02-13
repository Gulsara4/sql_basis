
with id_piz as (select pizzeria.id from pizzeria where pizzeria.name='Dominos')

insert into menu(id, pizzeria_id, pizza_name, price )
VALUES((select max(id) from menu)+1, (select id from id_piz), 'sicilian pizza', 900) 