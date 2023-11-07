-- In 3.sql, choose a location of your own and write a SQL query to find the normal temperature at 0 meters, 100 meters, and 200 meters.
-- You might find Google Earth helpful if you’d like to find some coordinates to use!

select
    "0m",
    "100m",
    "200m"
from
    normals
where
    latitude = -50.5 and
    longitude = 30.5;
