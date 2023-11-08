-- 2.sql
-- Your general manager (i.e., the person who makes decisions about player contracts) asks you whether the team
-- should trade a current player for Cal Ripken Jr., a star player who’s likely nearing his retirement.
-- In 2.sql, write a SQL query to find Cal Ripken Jr.’s salary history.
--
-- Sort by year in descending order.
-- Your query should return a table with two columns, one for year and one for salary.

select
    year,
    salary
from
    salaries
where
    player_id = (
        select
            id
        from
            players
        where
            first_name = 'Cal' and
            last_name = 'Ripken'
    )
order by
    year desc;
