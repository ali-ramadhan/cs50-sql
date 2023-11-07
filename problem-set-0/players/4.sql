-- In 4.sql, write a SQL query to find the first and last names of players who were not born in the United States.
-- Sort the results alphabetically by first name, then by last name.

select
    first_name,
    last_name
from
    players
where
    birth_country is not 'USA'
order by
    first_name,
    last_name;
