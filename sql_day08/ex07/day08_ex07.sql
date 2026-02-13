--s1
begin;
update pizzeria set rating=0.9 where id=1;
update pizzeria set rating=0.9 where id=2;
commit;

--s1
begin;
update pizzeria set rating=0.8 where id=2;
update pizzeria set rating=0.8 where id=1;
commit;
select * from pizzeria;