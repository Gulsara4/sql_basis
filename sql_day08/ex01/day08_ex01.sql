----- lost update потерянное обновление
--s1 
begin transaction isolation level read committed;
--s2  
begin transaction isolation level read committed;
---s1  
select * from pizzeria; --1.png
update pizzeria 
set rating=4
WHERE name = 'Pizza Hut';
commit;
SELECT * from pizzeria; 
---s2 
select * from pizzeria; --2.png
update pizzeria 
set rating=3.6
WHERE name = 'Pizza Hut';
commit;