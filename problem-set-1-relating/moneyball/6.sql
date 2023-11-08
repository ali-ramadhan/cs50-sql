-- 6.sql
-- Which teams might be the biggest competition for the A’s this year?
-- In 6.sql, write a SQL query to return the top 5 teams, sorted by the total number of hits by players in 2001.
--
-- Call the column representing total hits by players in 2001 “total hits”.
-- Sort by total hits, highest to lowest.
-- Your query should return two columns, one for the teams’ names and one for their total hits in 2001.

select
    t.name,
    sum(pf.H) as total_hits
from
    teams as t
inner join
    performances as pf
    on t.id = pf.team_id
where
    pf.year = 2001
group by
    t.name
order by
    total_hits desc
limit 5;
