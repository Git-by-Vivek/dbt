with dir_writers as (select * from {{ source("view_details", "dir_writers") }})

select
    crew.tconst,
    split(
        case when crew.directors = '\\N' then '' else crew.directors end, ','
    ) directors,
    split(case when crew.writers = '\\N' then '' else crew.writers end, ',') writers
from dir_writers crew
