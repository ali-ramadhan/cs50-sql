-- In 8.sql, write a SQL query to find the average height and weight, rounded to two decimal places, of baseball players who debuted on or after January 1st, 2000.
-- Return the columns with the name “Average Height” and “Average Weight”, respectively.

select
    printf("%.1f", avg(height)) as "Average Height",
    printf("%.1f", avg(weight)) as "Average Weight"
from
    players
where
    debut >= '2000-01-01';
