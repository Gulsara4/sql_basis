
CREATE TABLE person_audit (
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    type_event CHAR(1) DEFAULT 'I' NOT NULL, 
    CHECK (type_event IN ('I', 'D', 'U')), 
    row_id BIGINT PRIMARY KEY, 
    name VARCHAR(100), 
    age INTEGER,
    gender VARCHAR(20), 
    address VARCHAR(255)
    
);

create function fnc_trg_person_insert_audit() returns trigger as $t$
begin 

insert into person_audit
select  current_timestaMP, 'I', new.id, new.name, new.age, new.gender, new.address;

return Null;
end;
$t$
LANGUAGE plpgsql;

create trigger  trg_person_insert_audit after insert  on person
for each row execute procedure fnc_trg_person_insert_audit();



INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
