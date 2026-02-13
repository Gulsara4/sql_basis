with c1 as (select person_visits.pizzeria_id as pop1 from person_visits 
join person on person.id=person_visits.person_id
where person.name='Andrey' ),


c2 as (select menu.pizzeria_id as pop2 from person_order
join person on person.id=person_order.person_id
join menu on menu.id=person_order.menu_id
where person.name='Andrey' )
select  pizzeria.name as pizzeria_name from c1
join pizzeria on pizzeria.id= c1.pop1
EXCEPT
select pizzeria.name from c2
join pizzeria on pizzeria.id= c2.pop2
