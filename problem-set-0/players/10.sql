-- In 10.sql, write SQL query to answer a question of your choice. This query should:
--   Make use of AS to rename a column
--   Involve at least condition, using WHERE
--   Sort by at least one column using ORDER BY

select
    birth_country,
    count(*) as "Number of players"
from
    players
where
    birth_country is not null
group by
    birth_country
order by
    "Number of players" desc;
