-- In 10.sql, write SQL query to answer a question of your choice. This query should:
--   Make use of AS to rename a column
--   Involve at least condition, using WHERE
--   Sort by at least one column using ORDER BY

select
    (strftime('%Y', debut) / 10 * 10) || 's' as debut_decade,
    printf("%.1f", avg(height)) as average_height,
    printf("%d", avg(weight)) as average_weight,
    count(*) as n_players
from
    players
where
    debut is not null
group by
    debut_decade
order by
    debut_decade;
