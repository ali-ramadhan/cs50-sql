-- In 1.sql, write a SQL query to find the hometown (including city, state, and country) of Jackie Robinson.

select
    birth_city,
    birth_state,
    birth_country
from
    players
where
    first_name = 'Jackie' and
    last_name = 'Robinson';
