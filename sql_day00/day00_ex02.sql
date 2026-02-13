select name , rating
FROM pizzeria 
where rating>= 3.5 and rating<=5.0
ORDER BY rating ;


select name, rating  
FROM pizzeria 
where rating between 3.5 and  5.0
ORDER BY rating 
