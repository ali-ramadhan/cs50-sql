-- Ingredients
-- We certainly need to keep track of our ingredients.
-- Some of the typical ingredients we use include flour, yeast, oil, butter, and several different types of sugar.
-- Moreover, we would love to keep track of the price we pay per unit of ingredient (whether it’s pounds, grams, etc.).

create table if not exists ingredients (
    id integer,
    name text not null,
    price_per_unit real not null,
    unit text not null,
    primary key(id)
);


-- Donuts
-- We’ll need to include our selection of donuts, past and present!
-- For each donut on the menu, we’d love to include three things:
--     * The name of the donut
--     * Whether the donut is gluten-free
--     * The price per donut
-- Oh, and it’s important that we be able to look up the ingredients for each of the donuts!

create table if not exists donuts (
    id integer,
    name text not null,
    gluten_free text not null,
    price real not null,
    primary key(id)
);

create table if not exists donut_ingredients (
    donut_id integer not null,
    ingredient_id integer not null,
    primary key(donut_id, ingredient_id),
    foreign key(donut_id) references donuts(id),
    foreign key(ingredient_id) references ingredients(id)
);


-- Customers
-- Oh, and we realize it would be lovely to keep track of some information about each of our customers.
-- We’d love to remember the history of the orders they’ve made. In that case, we think we should store:
--     * A customer’s first and last name
--     * A history of their orders

create table if not exists customers (
    id integer,
    first_name text not null,
    last_name text not null,
    primary key(id)
);


-- Orders
-- We love to see customers in person, though we realize a good number of people might order online nowadays.
-- We’d love to be able to keep track of those online orders. We think we would need to store:
--     * An order number, to keep track of each order internally
--     * All the donuts in the order
--     * The customer who placed the order. We suppose we could assume only one customer places any given order.

create table if not exists orders (
    id integer,
    customer_id integer not null,
    order_time numeric not null,
    primary key(id),
    foreign key(customer_id) references customers(id)
);

create table if not exists order_items (
    order_id integer not null,
    donut_id integer not null,
    quantity integer not null,
    primary key(order_id, donut_id),
    foreign key(order_id) references orders(id),
    foreign key(donut_id) references donuts(id)
)
