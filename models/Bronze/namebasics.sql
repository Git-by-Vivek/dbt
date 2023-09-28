select
 nconst ,
 case when primaryname='\\N' then null else primaryname end primaryname,
case when birthYear ='\\N' then null else safe_cast(birthyear as int64) end birthYear,
case when deathYear ='\\N' then null else safe_cast(deathyear as int64) end deathYear,
split(coalesce(primaryProfession,'\\N')) primaryProfession,
split(knownForTitles,',') knownForTitles
from {{ source('view_details', 'names data') }}
