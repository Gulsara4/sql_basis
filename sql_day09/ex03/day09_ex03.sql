DROP TRIGGER IF EXISTS trg_person_insert_audit on person;
DROP FUNCTION IF EXISTS  fnc_trg_person_insert_audit();



DROP TRIGGER IF EXISTS trg_person_delete_audit on person;
DROP FUNCTION IF EXISTS  fnc_trg_person_delete_audit();


DROP TRIGGER IF EXISTS trg_person_update_audit on person;
DROP FUNCTION IF EXISTS  fnc_trg_person_update_audit();


CREATE OR REPLACE function fnc_trg_person_audit()
returns TRIGGER as 
$$
begin 
if (tg_op='INSERT') then 
insert into person_audit
select  current_timestaMP, 'I', new.id, new.name, new.age, new.gender, new.address;
return New;
end if ;
if (tg_op='UPDATE') THEN
insert into person_audit (created, type_event, row_id, name, age, gender, address)
select     current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address;
return New;
end if;
if (tg_op='DELETE') then 
insert into person_audit (created, type_event, row_id, name, age, gender, address)
select     current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address;
return OLD;
end if;

end;
$$ 
LANGUAGE plpgsql;

create trigger trg_person_audit before delete or insert or  update  on person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();



INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;