-- 11.sql
-- Is there a relationship between school expenditures and graduation rates?
-- In 11.sql, write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate.
-- Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.
-- You should assume a school spends the same amount per-pupil their district as a whole spends.

select
    s.name,
    e.per_pupil_expenditure,
    g.graduated
from
    schools as s
inner join
    expenditures as e
    on s.district_id = e.district_id
inner join
    graduation_rates as g
    on s.id = g.school_id
order by
    e.per_pupil_expenditure desc,
    s.name;
