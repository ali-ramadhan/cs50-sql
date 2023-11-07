-- In 2.sql, write a SQL query to find the normal temperature of the deepest sensor near the Gulf of Maine, at the same coordinate above.
-- The deepest sensor records temperatures at 225 meters of depth, so you can find this data in the 225m column.

select
    "225m"
from
    normals
where
    latitude = 42.5 and
    longitude = -69.5;
