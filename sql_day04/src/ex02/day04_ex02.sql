CREATE view v_generated_dates as (SELECT date_trunc('day', dd):: date as generated_date
FROM generate_series
        ( '2022-01-01'::timestamp 
        , '2022-01-31'::timestamp
        , '1 day'::interval) dd
        )