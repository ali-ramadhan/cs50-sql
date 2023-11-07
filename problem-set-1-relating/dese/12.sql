-- 12.sql
-- A parent asks you for advice on finding the best public school districts in Massachusetts.
-- In 12.sql, write a SQL query to find public school districts with above-average per-pupil expenditures
-- and an above-average percentage of teachers rated “exemplary”.
-- Your query should return the districts’ names, along with their per-pupil expenditures and percentage of
-- teachers rated exemplary.
-- Sort the results first by the percentage of teachers rated exemplary (high to low), then by the
-- per-pupil expenditure (high to low).

select
    d.name,
    e.per_pupil_expenditure,
    s.exemplary
from
    districts as d
inner join
    expenditures as e
    on d.id = e.district_id
inner join
    staff_evaluations as s
    on d.id = s.district_id
where
    d.type = 'Public School District' and
    e.per_pupil_expenditure > (
        select avg(per_pupil_expenditure)
        from expenditures
    ) and
    s.exemplary > (
        select avg(exemplary)
        from staff_evaluations
    )
order by
    s.exemplary desc,
    e.per_pupil_expenditure desc;
