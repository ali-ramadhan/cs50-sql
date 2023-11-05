-- In 2.sql, list the season number of, and title of, the first episode of every season.

select season, title
from episodes
where episode_in_season = 1;
