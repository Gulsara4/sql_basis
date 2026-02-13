select  distinct person_id 
FROM person_visits
where (visit_date BETWEEN'20220106' and '20220109' )
 or  person_id=2
 order by person_id desc
