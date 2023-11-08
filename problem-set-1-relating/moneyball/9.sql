-- 9.sql
-- What salaries are other teams paying? In 9.sql, write a SQL query to find the 5 lowest paying teams (by average salary) in 2001.
--
-- Round the average salary column to two decimal places and call it “average salary”.
-- Sort the teams by average salary, least to greatest.
-- Your query should return a table with two columns, one for the teams’ names and one for their average salary.

select
    t.name,
    round(avg(s.salary), 2) as "average salary"
from
    salaries as s
inner join
    teams as t
    on s.team_id = t.id
where
    s.year = 2001
group by
    t.name
order by
    "average salary" asc
limit 5;
