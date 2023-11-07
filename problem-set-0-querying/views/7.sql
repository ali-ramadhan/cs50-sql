-- In 7.sql, write a SQL query to list the English titles of the 5 brightest prints by Hiroshige, from most to least bright.
-- Compare them to this list on Wikipedia to see if your results match the print’s aesthetics.

select english_title
from views
where artist = 'Hiroshige'
order by brightness desc
limit 5;
