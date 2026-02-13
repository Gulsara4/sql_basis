----READ UNCOMMITTED  транзакция может видеть результаты других транзакций, даже если они ещё не закоммичены.
---READ COMMITTED транзакция может читать только те изменения в других параллельных транзакциях,
--- которые уже были закоммичены.
---- REPEATABLE READ  пока транзакция не завершится, никто параллельно не может изменять
--- или удалять строки, которые транзакция уже прочитала.
--session 1; 'fearowpi'  1.png 
--- SERIALIZABLE блокирует любые действия, пока запущена транзакция
Begin ;
update pizzeria
set rating=5.0
where name= 'Pizza Hut';
select * from pizzeria;


--session 2; 'fea' 2.png
SELECT * from pizzeria;


--session 2; 'fea' 4.png
SELECT * from pizzeria;