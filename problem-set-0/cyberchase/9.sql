-- In 9.sql, write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.

select count(*)
from episodes
where air_date between '2002-01-01' and '2007-12-31';
