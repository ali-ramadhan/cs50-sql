-- No Descriptions
-- In no_descriptions.sql, write a SQL statement to create a view named no_descriptions that includes
-- all of the columns in the listings table except for description.

create view no_descriptions as
select
    id,
    property_type,
    host_name,
    accommodates,
    bedrooms
from
    listings;
