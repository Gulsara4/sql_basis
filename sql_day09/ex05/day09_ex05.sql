CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR)
RETURNS TABLE (id INT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) AS

$$
BEGIN
    IF pgender = 'male' THEN
        RETURN QUERY
        SELECT * FROM person WHERE gender = 'male';
    ELSE
        RETURN QUERY
        SELECT * FROM person WHERE gender = 'female';
    END IF;
END;

$$ LANGUAGE plpgsql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
