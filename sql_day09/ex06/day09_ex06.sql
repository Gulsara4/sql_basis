CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
(IN pperson varchar DEFAULT 'Dmitry', in  pprice numeric DEFAULT 500, in pdate date DEFAULT '2022-01-08' )

RETURNS TABLE ( name VARCHAR) AS $$
begin
return query

    SELECT  pizzeria.name
    FROM pizzeria
    join menu on menu.pizzeria_id= pizzeria.id
    join person_visits on person_visits.pizzeria_id=pizzeria.id
    join person on person.id =person_visits.person_id
    where person_visits.visit_date=pdate and price <pprice and person.name=pperson;
   
   
end;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
