-- In 2.sql, write a SQL query to list the average colors of prints by Hokusai that include “river” in the English title. (As an aside, do they have any hint of blue?)

select
    average_color
from
    views
where
    artist = 'Hokusai' and
    lower(english_title) like '%river%';
