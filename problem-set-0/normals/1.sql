-- In 1.sql, write a SQL query to find the normal ocean surface temperature in the Gulf of Maine, off the coast of Massachusetts.
-- To find this temperature, look at the data associated with 42.5° of latitude and -69.5° of longitude.

select
    "0m"
from
    normals
where
    latitude = 42.5 and
    longitude = -69.5;
