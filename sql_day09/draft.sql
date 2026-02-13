create table person_audit(
created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
type_event char (1) default 'I' Not null, 
  check ( type_event in('I', 'D', 'U')),
  row_id bigint not null,
  name varchar,
  gender varchar,
  address varchar
)