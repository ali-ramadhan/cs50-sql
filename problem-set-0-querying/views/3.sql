-- In 3.sql, write a SQL query to count how many prints by Hokusai include “Fuji” in the English title.
-- Though all of Hokusai’s prints focused on Mt. Fuji, in how many did “Fuji” make it into the title?

select
    count(*)
from
    views
where
    artist = 'Hokusai' and
    lower(english_title) like '%fuji%';
