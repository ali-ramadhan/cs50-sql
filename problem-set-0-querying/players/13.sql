-- Write a single SQL query to list the first and last names of all players of above average height, sorted tallest to shortest, then by first and last name.

select
    first_name,
    last_name
from
    players
where
    height > (select avg(height) from players)
order by
    height desc,
    first_name,
    last_name;
