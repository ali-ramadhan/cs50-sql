-- 8.sql
-- A parent wants to send their child to a district with many other students.
-- In 8.sql, write a SQL query to display the names of all school districts and the number of pupils enrolled in each.

select
    d.name,
    e.pupils
from
    districts as d
inner join
    expenditures as e
    on d.id = e.district_id
order by
    e.pupils desc;
