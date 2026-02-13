COMMENT on TABLE person_discounts is 'table provide information about personal discount to each person';
comment on COLUMN person_discounts.id is 'key of each record';
comment on COLUMN person_discounts.person_id is 'person who has personal discount';
comment on COLUMN person_discounts.pizzeria_id is 'which pizzeria gives discount';
comment on COLUMN person_discounts.discount is 'personal discount';

--проверка 
SELECT 
    a.attname AS column_name,
    d.description
FROM 
    pg_catalog.pg_attribute a
JOIN 
    pg_catalog.pg_class c ON a.attrelid = c.oid
LEFT JOIN 
    pg_catalog.pg_description d ON d.objoid = c.oid AND d.objsubid = a.attnum
WHERE 
    c.relname = 'person_discounts' AND a.attnum > 0;