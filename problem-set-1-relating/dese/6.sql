-- 6.sql
-- DESE wants to assess which schools achieved a 100% graduation rate.
-- In 6.sql, write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

select
    s.name
from
    graduation_rates as gr
inner join
    schools as s on gr.school_id = s.id
where
    gr.graduated = 100;
