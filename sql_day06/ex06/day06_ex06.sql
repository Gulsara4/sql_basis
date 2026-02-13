CREATE sequence seq_person_discounts start with 1;
alter table  person_discounts
alter COLUMN person_discounts.id set default nextval('seq_person_discounts');
select setval ('seq_person_discounts', (select count(*)+1 from person_discounts));