with title_akas as(
    select 
    titleId,
    ordering,
    title,
    region,
    language,
    types,
    attributes,
    isOriginalTitle
     from {{ source('view_details', 'title_akas') }}
)
select
titleId ,
case when ordering='\\N' then null else cast(ordering as int64) end ordering,
case when title ='\\N' then null else title end title,
case when region ='\\N' then null else region end region,
case when language ='\\N' then null else language end language,
split(case when types ='\\N' then '' else types end,',') types,
split(case when attributes ='\\N' then '' else attributes end,',') attributes,
case when isOriginalTitle ='\\N' then cast('0' as int64) else cast(isOriginalTitle as int64) end isOriginalTitle
--cast(0 as boolean) else cast(cast(isOriginalTitle as int64) as boolean) end,
from title_akas
