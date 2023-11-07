-- 10.sql
-- In Massachusetts, school district expenditures are in part determined by local taxes on property (e.g., home) values.
-- In 10.sql, write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. Your query should return the names of the districts and the per-pupil expenditure for each.

select
    d.name,
    e.per_pupil_expenditure
from
    districts as d
inner join
    expenditures as e
    on d.id = e.district_id
where
    d.type = 'Public School District'
order by
    e.per_pupil_expenditure desc
limit 10;
