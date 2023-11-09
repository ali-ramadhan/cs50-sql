-- Passengers
-- When it comes to our passengers, we just need to have the essentials in line: the first name, last name, and age.
-- That’s all we need to know—nothing more.

create table if not exists passengers (
    id integer,
    first_name text not null,
    last_name text not null,
    age integer not null,
    primary key(id)
);


-- Airlines
-- ATL’s a hub for many domestic and international airlines: names like Delta, British Airways, Air France, Korean Air, and Turkish Airlines.
-- The list goes on. So here’s what we track:
--     * The name of the airline
--     * The “concourse” or, shall I say, the section of our airport where the airline operates. We have 7 concourses: A, B, C, D, E, F, and T.

create table if not exists airlines (
    id integer,
    name text not null,
    concourse text not null check(concourse in ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    primary key(id)
);


-- Flights
-- We serve as many as 1,000 flights daily. To ensure that our passengers are never left wondering,
-- we need to give them all the critical details about their flight.
-- Here’s what we’d like to store:
--     * The flight number. For example, “900”. Just know that we sometimes re-use flight numbers.
--     * The airline operating the flight. You can keep it simple and assume one flight is operated by one airline.
--     * The code of the airport they’re departing from. For example, “ATL” or “BOS”.
--     * The code of the airport they’re heading to
--     * The expected departure date and time (to the minute, of course!)
--     * The expected arrival date and time, to the very same accuracy

create table if not exists flights (
    id integer,
    flight_number integer not null,
    airline_id integer not null,
    from_airport text not null,
    to_airport text not null,
    departure_time numeric not null,
    arrival_time numeric not null,
    primary key(id),
    foreign key(airline_id) references airlines(id)
);


-- Check-Ins
-- When passengers arrive at ATL, they’ll often “check in” to their flights.
-- That’s them telling us they’re here and all set to board.
-- We’d like to keep a tidy log of such moments.
-- And what would we need to log, you ask? Well, here’s what we need:
--     * The exact date and time at which our passenger checked in
--     * The flight they are checking in for, of course. Can’t lose track of where they’re headed, now can we?

create table if not exists checkins (
    id integer,
    passenger_id not null,
    flight_id not null,
    time numeric not null,
    primary key(id),
    foreign key(passenger_id) references passengers(id),
    foreign key(flight_id) references flights(id)
);
