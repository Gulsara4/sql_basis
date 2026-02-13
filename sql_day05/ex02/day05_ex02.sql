create index idx_person_name on person(upper(name));
set ENABLE_seqscan=off;
EXPLAIN ANALYsE
select * from person
where upper(name)='anna';