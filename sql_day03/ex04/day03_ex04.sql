with dif1 as ( 
  select pizzeria.name as pop from person_order
 join person on person.id=person_order.person_id
  join menu on menu.id =person_order.menu_id
join pizzeria on pizzeria.id =menu.pizzeria_id
    where gender='male'),
 dif2 as (
   select pizzeria.name as pop from person_order
 join person on person.id=person_order.person_id
   join menu on menu.id =person_order.menu_id
join pizzeria on pizzeria.id =menu.pizzeria_id
    where gender='female')
    
SELECT pop.pop as pizzeria_name  from ( (
    -- Получаем разницу между dif1 и dif2
    SELECT * FROM dif1
    EXCEPT
    SELECT * FROM dif2
)
UNION
 (
    -- Получаем разницу между dif2 и dif1
    SELECT * FROM dif2
    EXCEPT
    SELECT * FROM dif1
) )as pop
order by 1