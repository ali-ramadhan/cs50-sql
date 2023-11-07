with color_distances as (
    select
        english_title,
        artist,
        average_color,
        (
            (instr('0123456789ABCDEF', substr(upper(average_color), 2, 1)) - 1) * 16 +
            (instr('0123456789ABCDEF', substr(upper(average_color), 3, 1)) - 1)
        ) as red_distance,
        (
            (instr('0123456789ABCDEF', substr(upper(average_color), 4, 1)) - 1) * 16 +
            (instr('0123456789ABCDEF', substr(upper(average_color), 5, 1)) - 1)
        ) as green_distance,
        (
            (instr('0123456789ABCDEF', substr(upper(average_color), 6, 1)) - 1) * 16 +
            (instr('0123456789ABCDEF', substr(upper(average_color), 7, 1)) - 1)
        ) as blue_distance
    from
        views
)
select
    english_title,
    artist,
    average_color,
    red_distance,
    green_distance,
    blue_distance,
    red_distance + green_distance + blue_distance AS black_distance
from
    color_distances
order by
    black_distance;
