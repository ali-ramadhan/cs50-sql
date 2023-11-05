-- Write a SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States.
--   Your query should output a table with a single column for the title of each episode.
--   Try to find a better solution than LIKE if you can!

select title
from episodes
where strftime('%m', air_date) = '12';
