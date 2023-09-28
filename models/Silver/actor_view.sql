select 
titledata.primaryname name,
viewdata.date,
viewdata.title,
titles.characters ,
titleakas.region ,
titleakas.language ,
title.genres
from 
{{ ref('viewdata') }} viewdata
left outer join
{{ ref('title') }} title
on viewdata.tconst=title.tconst
inner join {{ ref('titleratings') }} ratings
on viewdata.tconst=ratings.tconst
left outer join 
{{ ref('nametitle') }} titles
on viewdata.tconst=titles.tconst
left outer join {{ ref('titleakas') }} titleakas
on viewdata.tconst=titleakas.titleid
left outer join {{ ref('titledata') }} titledata
on titles.nconst=titledata.nconst
left outer join {{ ref('crewdata') }} crew
on viewdata.tconst=crew.tconst
group by 1,2,3,4,5,6,7,8
