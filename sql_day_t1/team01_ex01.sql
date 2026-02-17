--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');


CREATE OR REPLACE VIEW ddd AS (
  SELECT
    user_id,
    money,
    currency_id,
    name,
    rate_to_usd,
    balance.updated AS b_up,
    currency.updated AS c_up,
    balance.updated - currency.updated AS diff,
    ABS(EXTRACT(EPOCH FROM (balance.updated - currency.updated))) AS epoch_diff,
    CASE
      WHEN (CURRENT_TIMESTAMP + (balance.updated - currency.updated)) < CURRENT_TIMESTAMP THEN 'past'
      ELSE 'future'
    END AS classification
  FROM
    balance
  JOIN
    currency ON currency.id = balance.currency_id
  --group by classification
  
);
SELECT 
  COALESCE( "user".name,  'not defined') as name,
  COALESCE("user".lastname,  'not defined')  as lastname,
  d.name as currency_name,
  d.rate_to_usd * d.money as currency_in_usd
FROM ddd d
full join "user" on "user".id=d.user_id
JOIN (
  SELECT 
    user_id, 
    currency_id, 
    money, 
    MIN(epoch_diff) as min_epoch_diff
  FROM ddd
  GROUP BY user_id, money, currency_id
) min_diffs
ON d.user_id = min_diffs.user_id 
AND d.currency_id = min_diffs.currency_id
AND d.money = min_diffs.money
AND d.epoch_diff = min_diffs.min_epoch_diff
ORDER BY name desc, lastname, currency_name;