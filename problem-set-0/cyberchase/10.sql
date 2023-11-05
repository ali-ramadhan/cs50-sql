-- In 10.sql, write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.

select id, title, production_code
from episodes
order by production_code;
