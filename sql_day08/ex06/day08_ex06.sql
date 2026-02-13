--s1
begin transaction isolation level repeatable read;
select sum(rating) from pizzeria ;
select sum(rating) from pizzeria ;
commit ;
select sum(rating) from pizzeria ;
--s2
begin transaction isolation level repeatable read;
insert into pizzeria select 11, 'Kazan Pizza 2', 4;
commit ;
select sum(rating) from pizzeria ;