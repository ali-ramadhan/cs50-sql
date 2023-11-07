-- In 6.sql, write a SQL query to return all normal ocean temperatures at 50m of depth, as well as their respective degrees of latitude and longitude, within the Arabian Sea.
-- Include latitude, longitude, and temperature columns. For simplicity, assume the Arabian Sea is encased in the following four coordinates:
--   20° of latitude, 55° of longitude
--   20° of latitude, 75° of longitude
--   0° of latitude, 55° degrees of longitude
--   0° of latitude, 75° degrees of longitude

select
    latitude,
    longitude,
    "50m"
from
    normals
where
    latitude between 0 and 20 and
    longitude between 55 and 75;
