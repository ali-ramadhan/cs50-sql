-- 1.sql
-- Your colleague is preparing a map of all public schools in Massachusetts.
-- In 1.sql, write a SQL query to find the names and cities of all public schools in Massachusetts.
-- Keep in mind that not all schools in the schools table are considered traditional public schools.
-- Massachusetts also recognizes charter schools, which (according to DESE!) are considered distinct.

select
    name,
    city
from
    schools
where
    type = 'Public School';
