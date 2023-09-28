select
tconst ,
ordering,
case when nconst ='\\N' then null else nconst end nconst,
case when category ='\\N' then null else category end category,
case when job ='\\N' then null else job end job,
case when characters ='\\N' then null else characters end characters
from {{ source('view_details', 'title_principals') }}
