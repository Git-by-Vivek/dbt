select 
title_view.title,
count(distinct(title_view.date)) view_count,
max(averagerating) averagerating,
max(title_view.isadult) isadult,
max(title_view.startyear) startyear, 
max(title_view.runtimeminutes) runtimeminutes
from 
{{ ref('titledate_view') }} title_view
group by 1
