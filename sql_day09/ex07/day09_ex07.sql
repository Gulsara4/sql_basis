CREATE OR REPLACE FUNCTION  func_minimum(arr numeric[]) RETURNS numeric AS $$  
DECLARE
	res numeric ;
   number_elem integer := array_length(arr, 1);  
  index integer := 1;  
BEGIN  
if (number_elem=0) then return 0; else res := arr[1]; end if;
   WHILE index <= number_elem LOOP  
   if (  arr[index]<res) then 
   res:=arr[index];
   end if;
     
     index =index + 1;  
   END LOOP;  
   return res;
END;  
$$ LANGUAGE plpgsql;  


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);