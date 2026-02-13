SELECT gs::date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS gs
LEFT JOIN (
    SELECT DISTINCT visit_date as pop
    FROM person_visits
    WHERE (person_id = 1 OR person_id = 2)
) AS pv
ON gs = pv.pop
WHERE pv.pop IS NULL;
