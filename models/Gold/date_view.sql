select 
title_view.date,
title_view.title,
max(title_view.runtimeminutes) runtimeminutes
from 
{{ ref('titledate_view') }} title_view
group by 1,2
