-- In 7.sql, write a SQL query to find the average ocean surface temperature, rounded to two decimal places, along the equator.
-- Call the resulting column “Average Equator Ocean Surface Temperature”.
-- The equator’s ocean surface temperatures can be found at all longitudes between the latitudes -0.5° and 0.5°, inclusive.

select
    printf("%.2f", avg("0m")) as "Average Equator Ocean Surface Temperature"
from
    normals
where
    latitude between -0.5 and 0.5;
