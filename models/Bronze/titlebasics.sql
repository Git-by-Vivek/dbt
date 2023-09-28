with title_basics as 
(select * 
from 
{{ source('view_details', 'title_basics') }})
select
tconst ,
case when titletype ='\\N' then null else titletype end titletype,
case when primaryTitle ='\\N' then null else primaryTitle end primaryTitle,
case when originalTitle ='\\N' then null else originalTitle end originalTitle,
isAdult,
case when startYear ='\\N' then null else cast(startYear as int64) end startYear,
case when endYear ='\\N' then null else cast(endYear as int64) end endYear,
case when runtimeMinutes ='\\N' then null else cast(runtimeMinutes as int64) end runtimeMinutes,
split(case when genres ='\\N' then '' else genres end,',') genres 
from title_basics
