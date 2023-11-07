-- *** The Lost Letter ***
-- Clerk, my name’s Anneke. I live over at 900 Somerville Avenue. Not long ago, I sent out a special letter. It’s meant for my friend Varsha.
-- She’s starting a new chapter of her life at 2 Finnegan Street, uptown. (That address, let me tell you: it was a bit tricky to get right the first time.)
-- The letter is a congratulatory note—a cheery little paper hug from me to her, to celebrate this big move of hers. Can you check if it’s made its way to her yet?

-- Check that both addresses exist and what type of address they are.
select *
from addresses
where address in ('900 Somerville Avenue', '2 Finnegan Street');

-- +-----+-----------------------+-------------+
-- | id  |        address        |    type     |
-- +-----+-----------------------+-------------+
-- | 432 | 900 Somerville Avenue | Residential |
-- +-----+-----------------------+-------------+

select *
from packages
where from_address_id = (
    select id
    from addresses
    where address = '900 Somerville Avenue'
);

-- +------+-----------------------+-----------------+---------------+
-- |  id  |       contents        | from_address_id | to_address_id |
-- +------+-----------------------+-----------------+---------------+
-- | 384  | Congratulatory letter | 432             | 854           |
-- | 2437 | String                | 432             | 484           |
-- | 3529 | Letter opener         | 432             | 585           |
-- | 5436 | Whiteboard            | 432             | 4984          |
-- +------+-----------------------+-----------------+---------------+

select *
from addresses
where id = 854;

select *
from addresses
where id in (
    select to_address_id
    from packages
    where contents = 'Congratulatory letter' and
        from_address_id in (
        select id
        from addresses
        where address = '900 Somerville Avenue'
    )
);

-- +-----+-------------------+-------------+
-- | id  |      address      |    type     |
-- +-----+-------------------+-------------+
-- | 854 | 2 Finnigan Street | Residential |
-- +-----+-------------------+-------------+

select *
from scans
where package_id = 384;

-- +----+-----------+------------+------------+--------+----------------------------+
-- | id | driver_id | package_id | address_id | action |         timestamp          |
-- +----+-----------+------------+------------+--------+----------------------------+
-- | 54 | 1         | 384        | 432        | Pick   | 2023-07-11 19:33:55.241794 |
-- | 94 | 1         | 384        | 854        | Drop   | 2023-07-11 23:07:04.432178 |
-- +----+-----------+------------+------------+--------+----------------------------+

-- *** The Devious Delivery ***
-- Good day to you, deliverer of the mail. You might remember that not too long ago I made my way over from the town of Fiftyville.
-- I gave a certain box into your reliable hands and asked you to keep things low. My associate has been expecting the package for a while now.
-- And yet, it appears to have grown wings and flown away. Ha! Any chance you could help clarify this mystery? Afraid there’s no “From” address.
-- It’s the kind of parcel that would add a bit more… quack to someone’s bath times, if you catch my drift.

select *
from packages
where from_address_id is null;

-- +------+---------------+-----------------+---------------+
-- |  id  |   contents    | from_address_id | to_address_id |
-- +------+---------------+-----------------+---------------+
-- | 5098 | Duck debugger | NULL            | 50            |
-- +------+---------------+-----------------+---------------+

select *
from addresses
where id = 50;

-- +----+-------------------+-------------+
-- | id |      address      |    type     |
-- +----+-------------------+-------------+
-- | 50 | 123 Sesame Street | Residential |
-- +----+-------------------+-------------+

select *
from scans
where package_id = 5098;

-- +-------+-----------+------------+------------+--------+----------------------------+
-- |  id   | driver_id | package_id | address_id | action |         timestamp          |
-- +-------+-----------+------------+------------+--------+----------------------------+
-- | 30123 | 10        | 5098       | 50         | Pick   | 2023-10-24 08:40:16.246648 |
-- | 30140 | 10        | 5098       | 348        | Drop   | 2023-10-24 10:08:55.610754 |
-- +-------+-----------+------------+------------+--------+----------------------------+

select *
from addresses
where id = 348;

-- +-----+------------------+----------------+
-- | id  |     address      |      type      |
-- +-----+------------------+----------------+
-- | 348 | 7 Humboldt Place | Police Station |
-- +-----+------------------+----------------+

-- *** The Forgotten Gift ***
-- Oh, excuse me, Clerk. I had sent a mystery gift, you see, to my wonderful granddaughter, off at 728 Maple Place. That was about two weeks ago.
-- Now the delivery date has passed by seven whole days and I hear she still waits, her hands empty and heart filled with anticipation.
-- I’m a bit worried wondering where my package has gone. I cannot for the life of me remember what’s inside, but I do know it’s filled to the
-- brim with my love for her. Can we possibly track it down so it can fill her day with joy? I did send it from my home at 109 Tileston Street.

select *
from addresses
where address in ('728 Maple Place', '109 Tileston Street');

-- +------+---------------------+-------------+
-- |  id  |       address       |    type     |
-- +------+---------------------+-------------+
-- | 4983 | 728 Maple Place     | Residential |
-- | 9873 | 109 Tileston Street | Residential |
-- +------+---------------------+-------------+

select *
from packages
where
    from_address_id = 9873 and
    to_address_id = 4983;

-- +------+----------+-----------------+---------------+
-- |  id  | contents | from_address_id | to_address_id |
-- +------+----------+-----------------+---------------+
-- | 9523 | Flowers  | 9873            | 4983          |
-- +------+----------+-----------------+---------------+

select *
from scans
where package_id = 9523;

-- +-------+-----------+------------+------------+--------+----------------------------+
-- |  id   | driver_id | package_id | address_id | action |         timestamp          |
-- +-------+-----------+------------+------------+--------+----------------------------+
-- | 10432 | 11        | 9523       | 9873       | Pick   | 2023-08-16 21:41:43.219831 |
-- | 10500 | 11        | 9523       | 7432       | Drop   | 2023-08-17 03:31:36.856889 |
-- | 12432 | 17        | 9523       | 7432       | Pick   | 2023-08-23 19:41:47.913410 |
-- +-------+-----------+------------+------------+--------+----------------------------+

select *
from drivers
where id = 17;

-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 17 | Mikel |
-- +----+-------+
