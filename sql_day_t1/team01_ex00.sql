Drop view if EXISTS pop;
create or replace view pop  as (
select name, lastname, balance.type, sum(money) as max_c, currency_id as cc
  from "user"
  full join balance on balance.user_id="user".id
  group by "user".id, balance.type, currency_id
);

SELECT 
COALESCE(pop.name, 'not defined') as name, 
COALESCE(pop.lastname,'not defined') as lastname, 
pop.type,
pop.max_c as volume, 
COALESCE(currency_name, 'not defined') as currency_name,
COALESCE(currency.rate_to_usd, 1) as last_rate_to_usd, 
cOALESCE(currency.rate_to_usd, 1)*pop.max_c as total_volume_in_usd
FROM pop
full JOIN (
    SELECT id, currency.name as currency_name, rate_to_usd, updated
    FROM currency
    WHERE (id, updated) IN (
        SELECT id, MAX(updated)
        FROM currency
        GROUP BY id
    )
) AS currency ON currency.id = pop.cc
 order by name desc, lastname, type;
  WITH
      last_dates AS (SELECT id, name, MAX(updated) AS updated
                       FROM currency
                   GROUP BY id, name),
      update_cur AS (SELECT id AS currency_id, name AS currency_name, rate_to_usd
                       FROM currency
                       JOIN last_dates USING(id, name, updated)),
      sumbalance AS (SELECT currency_id, user_id, type, SUM(money) AS volume
                       FROM balance
                   GROUP BY currency_id, user_id, type)
SELECT
      COALESCE(name, 'not defined') AS name,
      COALESCE(lastname, 'not defined') AS lastname,
      type,
      volume,
      COALESCE(currency_name, 'not defined') AS currency_name,
      COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
      volume * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
  FROM
      public.user AS u(user_id)
  FULL JOIN
      sumbalance AS sb USING(user_id)
  FULL JOIN
      update_cur AS uc USING(currency_id)
 ORDER BY
      name     DESC,
      lastname ASC,
      type     ASC;