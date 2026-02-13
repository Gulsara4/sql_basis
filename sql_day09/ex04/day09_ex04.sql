create FUNCTION fnc_persons_female()
returns Table (id int, name varchar, age int, gender varchar, address varchar)
as $$
select * from person where gender='female';
$$ LANGUAGE SQL;
create FUNCTION fnc_persons_male()
returns Table (id int, name varchar, age int, gender varchar, address varchar)
as $$
select * from person where gender='male';
$$ LANGUAGE SQL;


SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
