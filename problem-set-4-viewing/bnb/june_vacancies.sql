-- June Vacancies
-- In june_vacancies.sql, write a SQL statement to create a view named june_vacancies.
-- This view should contain all listings and the number of days in June of 2023 that they remained vacant.
--
-- Ensure the view contains the following columns:
--     * id, which is the id of the listing from the listings table.
--     * property_type, from the listings table.
--     * host_name, from the listings table.
--     * days_vacant, which is the number of days in June of 2023, that the given listing was marked as available.

create view june_vacancies as
select
    l.id,
    l.property_type,
    l.host_name,
    count(a.date) as days_vacant
from
    listings as l
inner join
    availabilities as a
    on l.id = a.listing_id
where
    cast(strftime('%Y', a.date) as int) = 2023 and
    cast(strftime('%m', a.date) as int) = 6 and
    a.available = 'TRUE'
group by
    l.id,
    l.property_type,
    l.host_name;
