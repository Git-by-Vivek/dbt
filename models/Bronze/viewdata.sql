select
title.tconst,
viewdata.title ,
viewdata.date,
--title.titletype,
--title.runtimeminutes
from {{ source('view_details', 'view_data') }} viewdata
left outer join {{ ref('titlebasics') }} title
on trim(viewdata.title)=trim(title.primaryTitle)
group by 1,2,3
