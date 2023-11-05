-- In 5.sql, find the title of the holiday episode that aired on December 31st, 2004.

select title
from episodes
where air_date = '2004-12-31';
