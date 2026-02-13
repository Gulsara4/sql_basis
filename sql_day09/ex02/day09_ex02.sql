
CREATE OR REPLACE function fnc_trg_person_delete_audit()
returns TRIGGER as 
$$
begin 

insert into person_audit (created, type_event, row_id, name, age, gender, address)
select     current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address;
return OLD;
end;
$$ 
LANGUAGE plpgsql;
create trigger trg_person_delete_audit before delete on person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;


SELECT * from person;
Select * from person_audit;