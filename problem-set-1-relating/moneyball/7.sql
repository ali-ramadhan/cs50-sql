-- 7.sql
-- You need to make a recommendation about which player (or players) to avoid recruiting.
-- In 7.sql, write a SQL query to find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.
--
-- Your query should return a table with two columns, one for the player’s first name and one for their last name.

select
    p.first_name,
    p.last_name
from
    players as p
where
    id = (
        select player_id
        from salaries
        where salary = (
            select max(salary)
            from salaries
        )
    );
