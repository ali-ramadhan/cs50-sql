-- In 6.sql, write a SQL query to find the average entropy of prints by Hiroshige, rounded to two decimal places.
-- Call the resulting column “Hiroshige Average Entropy”.

select printf('%.2f', avg(entropy)) as "Hiroshige Average Entropy"
from views
where artist = 'Hiroshige';
