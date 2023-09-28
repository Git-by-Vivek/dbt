select a.tconst,a.nconst,max(a.primaryname) primaryname,max(characters) characters
from(
select tconst ,nconst,'' primaryname,characters from {{ ref('titleprincipals') }} a
UNION ALL
select titles tconst,
names.nconst,
names.primaryname,
'' characters 
from {{ ref('namebasics') }} names,
unnest(names.primaryprofession) as profession,
unnest(names.knownfortitles) as titles
)a
group by 1,2
