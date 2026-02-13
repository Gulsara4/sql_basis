CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) 
RETURNS TABLE(step integer, value integer) AS

$$
DECLARE
    prev_value integer := 0;
    curr_value integer := 1;
    i integer:=2;
BEGIN
    
    RETURN QUERY SELECT 0, 0;
    if ( pstop=1) then RETURN QUERY SELECT 1, 1; end if;
  
    FOR i IN 2..pstop LOOP      
        curr_value := prev_value + curr_value;
        prev_value := curr_value - prev_value;

        RETURN QUERY SELECT i, curr_value;
    END LOOP;
   
END;

$$ LANGUAGE plpgsql;