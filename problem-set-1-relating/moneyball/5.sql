-- 5.sql
-- It’s a bit of a slow day in the office.
-- Though Satchel no longer plays, in 5.sql, write a SQL query to find all teams that Satchel Paige played for.
-- Your query should return a table with a single column, one for the name of the teams.

select distinct
    t.name
from
    teams as t
inner join
    performances as pf
    on t.id = pf.team_id
inner join
    players as pl
    on pl.id = pf.player_id
where
    pf.player_id = (
        select id
        from players
        where first_name = 'Satchel' and last_name = 'Paige'
    );
