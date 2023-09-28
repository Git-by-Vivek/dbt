select names.nconst,names.primaryname,titles 
from {{ ref('namebasics') }}  names,
unnest(names.primaryprofession) as profession,
unnest(names.knownfortitles) as titles
