select  person.name, count(person_id) as count_visits from person_visits
join person on person.id=person_id
group by person.name 
order by  2 desc, 1 asc
limit 4