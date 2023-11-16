-- Frequently Reviewed
-- In frequently_reviewed.sql, write a SQL statement to create a view named frequently_reviewed.
-- This view should contain the 100 most frequently reviewed listings, sorted from most- to least-frequently reviewed.
--
-- Ensure the view contains the following columns:
--     * id, which is the id of the listing from the listings table.
--     * property_type, from the listings table.
--     * host_name, from the listings table.
--     * reviews, which is the number of reviews the listing has received.
--
-- If any two listings have the same number of reviews, sort by property_type (in alphabetical order),
-- followed by host_name (in alphabetical order).

create view frequently_reviewed as
select
    l.id,
    l.property_type,
    l.host_name,
    count(r.id) as reviews
from
    listings as l
inner join
    reviews as r
    on l.id = r.listing_id
group by
    l.id,
    l.property_type,
    l.host_name
order by
    reviews desc,
    property_type
limit 100;
