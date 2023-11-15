create table meteorites_staging (
    name text,
    id int,
    nametype text,
    class text,
    mass real,
    discovery text,
    year int,
    lat real,
    long real,
    primary key(id)
);


.import --csv --skip 1 meteorites.csv meteorites_staging


-- To consider the data in the meteorites table clean, you should ensure...
-- 1. Any empty values in meteorites.csv are represented by NULL in the meteorites table.
--    Keep in mind that the mass, year, lat, and long columns have empty values in the CSV.

update meteorites_staging
set mass = null
where mass = '';

update meteorites_staging
set year = null
where year = '';

update meteorites_staging
set lat = null
where lat = '';

update meteorites_staging
set long = null
where long = '';


-- 2. All columns with decimal values (e.g., 70.4777) should be rounded to the nearest hundredths place (e.g., 70.4777 becomes 70.48).
--    Keep in mind that the mass, lat, and long columns have decimal values.

update
    meteorites_staging
set
    mass = round(mass, 2),
    lat = round(lat, 2),
    long = round(long, 2);

-- 3. All meteorites with the nametype “Relict” are not included in the meteorites table.

delete from meteorites_staging
where nametype = 'Relict';

-- 4. The meteorites are sorted by year, oldest to newest, and then—if any two meteorites landed
--    in the same year—by name, in alphabetical order.
-- 5. You’ve updated the IDs of the meteorites from meteorites.csv, according to the order specified in #4.
--    The id of the meteorites should start at 1, beginning with the meteorite that landed in the oldest
--    year and is the first in alphabetical order for that year.

create table meteorites (
    id int,
    name text,
    class text,
    mass real,
    discovery text,
    year int,
    lat real,
    long real,
    primary key(id)
);

insert into meteorites (
    id,
    name,
    class,
    mass,
    discovery,
    year,
    lat,
    long
) select
    row_number() over (order by year, name),
    name,
    class,
    mass,
    discovery,
    year,
    lat,
    long
from
    meteorites_staging;

drop table meteorites_staging;

