-- In 13.sql, write a SQL query to explore a question of your choice. This query should:
--   Involve at least one condition, using WHERE with AND or OR

select season, count(*)
from episodes
where topic is not null
group by season;
