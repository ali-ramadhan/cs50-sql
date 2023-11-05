-- Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
--   Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year.

select
    strftime('%Y', air_date) as year,
    min(strftime('%m-%d', air_date)) as first_release
from
    episodes
group by
    year
order by
    year;
