with titles 
as
(select * 
from {{ source('view_details', 'titles') }}
)

select
crew.tconst,
case when crew.parentTconst='\\N' then '' else crew.parentTconst end parentTconst,
cast((case when crew.seasonNumber='\\N' then null else crew.seasonNumber end) as int64) seasonNumber,
cast((case when crew.episodeNumber='\\N' then null else crew.episodeNumber end) as int64) episodeNumber,
from titles crew
