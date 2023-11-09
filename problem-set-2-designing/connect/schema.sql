-- Users
-- The heart of LinkedIn’s platform is its people.
-- Your database should be able to represent the following information about LinkedIn’s users:
--     * Their first and last name
--     * Their username
--     * Their password

create table if not exists users (
    id integer,
    first_name text not null,
    last_name text not null,
    username text not null,
    password text not null,
    primary key(id)
);


-- Schools and Universities
-- LinkedIn also allows for official school or university accounts, such as that for Harvard,
-- so alumni (i.e., those who’ve attended) can identify their affiliation.
-- Ensure that LinkedIn’s database can store the following information about each school:
--     * The name of the school
--     * The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)
--     * The school’s location
--     * The year in which the school was founded

create table if not exists schools (
    id integer,
    name text not null,
    type text not null,
    location text not null,
    year_founded integer not null,
    primary key(id)
);


-- Companies
-- LinkedIn allows companies to create their own pages, like the one for LinkedIn itself,
-- so employees can identify their past or current employment with the company.
-- Ensure that LinkedIn’s database can store the following information for each company:
--     * The name of the company
--     * The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)
--     * The company’s location

create table if not exists companies (
    id integer,
    name text not null,
    industry text not null,
    location text not null,
    primary key(id)
);


-- Connections with People
-- LinkedIn’s database should be able to represent mutual (reciprocal, two-way) connections between users.
-- No need to worry about one-way connections, such as user A “following” user B without user B “following” user A.

create table if not exists user_connections (
    id integer,
    user1_id integer not null,
    user2_id integer not null,
    primary key(id),
    foreign key(user1_id) references users(id),
    foreign key(user2_id) references users(id),
    check (user1_id != user2_id), -- Ensures that a user cannot be connected to themselves
    unique (user1_id, user2_id) -- Ensures that each connection is unique
);


-- Connections with Schools
-- A user should be able to create an affiliation with a given school.
-- And similarly, that school should be able to find its alumni.
-- Additionally, allow a user to define:
--     * The start date of their affiliation (i.e., when they started to attend the school)
--     * The end date of their affiliation (i.e., when they graduated), if applicable
--     * The type of degree earned/pursued (e.g., “BA”, “MA”, “PhD”, etc.)

create table if not exists school_connections (
    id integer,
    user_id integer not null,
    school_id integer not null,
    start_date numeric not null,
    end_date numeric,
    degree text not null,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(school_id) references schools(id)
);


-- Connections with Companies
-- A user should be able to create an affiliation with a given company.
-- And similarly, a company should be able to find its current and past employees.
-- Additionally, allow a user to define:
--     * The start date of their affiliation (i.e., the date they began work with the company)
--     * The end date of their affiliation (i.e., when left the company), if applicable
--     * The title they held while affiliated with the company

create table if not exists company_connections (
    id integer not null,
    user_id integer not null,
    company_id integer not null,
    start_date numeric not null,
    end_date numeric,
    title text not null,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(company_id) references companies(id)
);
