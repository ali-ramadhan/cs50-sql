-- In 4.sql, write a query to find the titles of episodes that do not yet have a listed topic.

select title
from episodes
where topic is null;
