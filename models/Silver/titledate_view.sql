select 
viewdata.date,
viewdata.title,
ratings.averagerating averagerating,
title.isadult isadult,
title.startyear startyear, 
title.runtimeminutes runtimeminutes,
titleakas.region region,
titleakas.language language
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
left outer join {{ ref('titledata') }}
on titles.nconst=titledata.nconst
group by 1,2,3,4,5,6,7,8
