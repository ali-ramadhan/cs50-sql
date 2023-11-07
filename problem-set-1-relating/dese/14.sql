select
    d.type,
    avg(e.per_pupil_expenditure) as avg_per_pupil_expenditure
from
    districts as d
inner join
    expenditures as e
    on d.id = e.district_id
group by
    d.type;
