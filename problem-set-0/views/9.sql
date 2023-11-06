-- In 9.sql, write a SQL query to find the English title and artist of the print with the highest brightness.

select english_title, artist
from views
order by brightness desc
limit 1;
