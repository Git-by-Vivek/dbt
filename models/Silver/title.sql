select tconst,titletype,primarytitle,originaltitle,genres ,isadult,startyear,runtimeminutes 
from {{ ref('titlebasics') }} title,
unnest(title.genres) genres
