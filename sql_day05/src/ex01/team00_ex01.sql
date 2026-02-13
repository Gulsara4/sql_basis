Drop TABLE if EXISTS nodes , nodes_paths CASCADE;
CREATE TABLE IF not EXISTS nodes(
	id BIGINT PRIMARY KEY,
  	node1 varchar not null
);

INSERT into nodes VALUES
(1, 'a'),
(2, 'b'),
(3, 'd'),
(4, 'c');





CREATE TABLE IF not EXISTS nodes_paths(
	id BIGINT PRIMARY KEY,
  	from_node BIGINT not null, 
	to_node BIGINT NOT null,
  	cost BIGINT,
    FOREIGN key (from_node) REFERENCES nodes (id),
    FOREIGN key (to_node) REFERENCES nodes (id),
  constraint uk_person_visits unique (from_node, to_node)
);




INSERT into nodes_paths VALUES 
(1,1,2, 10),
(2,1,3,20),
(3,1,4,15),
(4,2, 1,10),
(5,2,3, 25),
(6,2,4, 35),
(7,3, 1, 20),
(8,3, 2, 25),
(9,3, 4, 30),
(10,4, 1, 15),
(11,4, 3, 30),
(12,4,2, 35);



drop view if EXISTS v_paths;
create or REPLACE VIEW v_paths as 
  SELECT paths.id,
          n1.node1 as src,
          n2.node1 as dist,
          paths.cost
  from nodes_paths as paths
  join nodes as n1
  on n1.id = paths.from_node
  join nodes as n2 
  on n2.id = paths.to_node;

--SELECT * from v_paths;

WITH 
RECURSIVE _t1 as (

  SELECT vp.src,
  		vp.dist,
        vp.src ||'-->' || vp.dist as way,
  		vp.cost as total_cost,
  		vp.cost as current_cost,
  		ARRAY[src, dist] as paths
  from  v_paths as vp
  WHERE  vp.src = 'a'
  
  UNION all
  
  SELECt t1.src ,
  		vp.dist,
        t1.way || '-->' || vp.dist,
  		t1.total_cost + vp.cost,
		vp.cost,
  		t1.paths || vp.dist
  from _t1 as t1
  JOIN v_paths as vp 
  on t1.dist = vp.src
  WHERE vp.dist != ALL(t1.paths)
),
pop1 as (
SELECT tmp.total_cost + vp.cost as total_cost,
	   tmp.paths || vp.dist as tour	
from _t1 as tmp
join v_paths as vp 
on tmp.dist = vp.src
where array_length(tmp.paths, 1) = 4 and vp.dist = 'a' 
order by 1, 2
  )
SELECT * from pop1 
 ;
 
  

