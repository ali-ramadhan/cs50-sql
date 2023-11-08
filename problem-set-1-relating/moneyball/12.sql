-- 12.sql
-- Hits are great, but so are RBIs!
-- In 12.sql, write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
--
-- Your query should return a table with two columns, one for the players’ first names and one of their last names.
-- You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
-- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
-- Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
-- Keep in mind the lessons you’ve learned in 10.sql and 11.sql!

with hit_cost as (
    select
        pf.player_id,
        s.salary,
        pf.H,
        s.salary / pf.H as dollars_per_hit
    from
        salaries as s
    join
        performances as pf
        on s.player_id = pf.player_id
        and s.year = pf.year
    where
        s.year = 2001 and
        pf.H > 0
),

hit_cost_ranked as (
    select
        player_id,
        dollars_per_hit,
        rank() over (order by dollars_per_hit) as dollars_per_hit_rank
    from
        hit_cost
),

rbi_cost as (
    select
        pf.player_id,
        s.salary,
        pf.RBI,
        s.salary / pf.RBI as dollars_per_rbi
    from
        salaries as s
    join
        performances as pf
        on s.player_id = pf.player_id
        and s.year = pf.year
    where
        s.year = 2001 and
        pf.RBI > 0
),

rbi_cost_ranked as (
    select
        player_id,
        dollars_per_rbi,
        rank() over (order by dollars_per_rbi) as dollars_per_rbi_rank
    from
        rbi_cost
),

cheapest_players as (
    select
        hcr.player_id
    from
        hit_cost_ranked as hcr
    inner join
        rbi_cost_ranked as rcr
        on hcr.player_id = rcr.player_id
    where
        hcr.dollars_per_hit_rank <= 10 and
        rcr.dollars_per_rbi_rank <= 10
)

select
    pl.first_name,
    pl.last_name
from
    cheapest_players as cp
inner join
    players as pl
    on cp.player_id = pl.id
order by
    pl.id;
