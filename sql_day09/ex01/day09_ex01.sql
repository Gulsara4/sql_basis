
CREATE OR REPLACE function fnc_trg_person_update_audit()
returns TRIGGER as 
$$
begin 

insert into person_audit (created, type_event, row_id, name, age, gender, address)
select     current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address;
return New;
end;
$$ 
LANGUAGE plpgsql;
create trigger trg_person_update_audit before UPDATE on person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Do' WHERE id = 10;



SELECT * from person;
Select * from person_audit;