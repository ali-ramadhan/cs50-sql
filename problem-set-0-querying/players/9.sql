-- In 9.sql, write a SQL query to find the players who played their final game in the MLB in 2022.
-- Sort the results alphabetically by first name, then by last name.

select
    first_name,
    last_name
from
    players
where
    final_game between '2022-01-01' and '2022-12-31'
order by
    first_name,
    last_name;
