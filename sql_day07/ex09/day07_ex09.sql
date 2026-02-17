with p1 as(select address, MAX(age)-(min(age)/max(age::numeric))as formula,  AVG(age) as average

from person 
group by address)

select p1.address, round(p1.formula, 2), round(p1.average, 2) ,
case 
when p1.formula> p1.average then 'true'
else 'false'
END AS comparison
from p1
order by 1