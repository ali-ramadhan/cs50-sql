-- One-Bedrooms
-- In one_bedrooms.sql, write a SQL statement to create a view named one_bedrooms.
-- This view should contain all listings that have exactly one bedroom.
-- Ensure the view contains the following columns:
--     * id, which is the id of the listing from the listings table.
--     * property_type, from the listings table.
--     * host_name, from the listings table.
--     * accommodates, from the listings table.

create view one_bedrooms as
select
    id,
    property_type,
    host_name,
    accommodates
from
    listings
where
    bedrooms = 1;
