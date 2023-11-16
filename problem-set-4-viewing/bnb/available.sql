-- Available
-- In available.sql, write a SQL statement to create a view named available.
-- This view should contain all dates that are available at all listings.
-- Ensure the view contains the following columns:
--     * id, which is the id of the listing from the listings table.
--     * property_type, from the listings table.
--     * host_name, from the listings table.
--     * date, from the availabilities table, which is the date of the availability.

create view available as
select
    l.id,
    l.property_type,
    l.host_name,
    a.date
from
    listings as l
inner join
    availabilities as a
    on l.id = a.listing_id
where
    a.available = 'TRUE';
