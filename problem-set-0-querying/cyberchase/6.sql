-- In 6.sql, list the titles of episodes from season 6 (2008) that were released early, in 2007.

select title
from episodes
where season = 6 and air_date <= '2007-12-31';
