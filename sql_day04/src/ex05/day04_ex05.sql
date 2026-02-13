create VIEW v_price_with_discount as (select person.name, menu.pizza_name, price, (price *0.9)::numeric::integer as discount_price from person_order
join menu on menu.id= person_order.menu_id
join person on person.id= person_order.person_id
order by person.name, discount_price);
--select * from v_price_with_discount