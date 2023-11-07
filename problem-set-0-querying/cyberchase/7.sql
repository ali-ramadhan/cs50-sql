-- In 7.sql, write a SQL query to list the titles and topics of all episodes teaching fractions.

select title, topic
from episodes
where lower(topic) like '%fractions%';
