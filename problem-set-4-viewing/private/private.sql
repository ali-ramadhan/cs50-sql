create table if not exists triplets (
    sentence_id int,
    starting_char int,
    length int
);

insert into triplets
    (sentence_id, starting_char, length)
values
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

create view message as
select
    s.id,
    s.sentence,
    t.starting_char,
    t.length,
    substr(s.sentence, t.starting_char, t.length) as phrase
from
    sentences as s
inner join
    triplets as t on s.id = t.sentence_id;

select phrase from message;
