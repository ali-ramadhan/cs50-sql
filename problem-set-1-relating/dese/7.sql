-- 7.sql
-- DESE is preparing a report on schools in the Cambridge school district.
-- In 7.sql, write a SQL query to find the names of all schools in the Cambridge school district.

select
    s.name
from
    schools as s
where
    district_id = (
        select id
        from districts
        where name = 'Cambridge'
    );
