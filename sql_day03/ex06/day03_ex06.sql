with c1 as ( 
  
  select menu.id as pop1, 
    menu.pizza_name as pop2,
    menu.price  as pop3,
    menu.pizzeria_id as pop4 ,
    pizzeria.name as pop5
  
    from menu
  join pizzeria on pizzeria.id =menu.pizzeria_id
)

SELECT distinct cc1.pop2 as pizza_name,
		(select pizzeria.name from pizzeria where cc1.pop4=pizzeria.id )as pizzeria_name_1,
		(select pizzeria.name from pizzeria where cc2.pop4=pizzeria.id ) as pizzeria_name_2,
        cc1.pop3 as price
from c1 as cc1
JOIN c1 as cc2
on cc1.pop2=cc2.pop2
where cc1.pop1>cc2.pop1 and cc1.pop3=cc2.pop3 
order by 1
