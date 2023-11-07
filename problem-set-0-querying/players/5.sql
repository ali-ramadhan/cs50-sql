-- In 5.sql, write a SQL query to return the first and last names of all right-handed batters.
-- Sort the results alphabetically by first name, then by last name.

select
    first_name,
    last_name
from
    players
where
    bats = 'R'
order by
    first_name,
    last_name;
