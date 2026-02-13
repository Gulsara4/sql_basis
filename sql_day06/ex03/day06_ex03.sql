create  UNIQUE index idx_person_discounts_unique 
on person_discounts( person_id, pizzeria_id);
insert into person_discounts(id, person_id, pizzeria_id, discount) 
select 100, 1, 1, 22.00
