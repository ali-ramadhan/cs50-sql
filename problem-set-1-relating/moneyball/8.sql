-- 8.sql
-- How much would the A’s need to pay to get the best home run hitter this past season? In 8.sql, write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.
--
-- Your query should return a table with one column, the salary of the player.

select
    s.salary
from
    salaries as s
where
    s.year = 2001 and
    s.player_id = (
        select
            player_id
        from
            performances
        where
            year = 2001 and
            hr = (
                select max(hr)
                from performances
                where year = 2001
            )
    );
