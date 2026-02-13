--drop view v_symmetric_union ;
create view v_symmetric_union as (select person_id from ((
    SELECT * 
    FROM person_visits
    WHERE visit_date = '2022-01-02'
    EXCEPT
    SELECT * 
    FROM person_visits
    WHERE visit_date = '2022-01-06'
)
UNION 
(
    SELECT * 
    FROM person_visits
    WHERE visit_date = '2022-01-06'
    EXCEPT
    SELECT * 
    FROM person_visits
    WHERE visit_date = '2022-01-02'
) order by person_id));
--select * from v_symmetric_union 