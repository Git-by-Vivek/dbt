select tconst,
directors,
writers 
from {{ ref('titlecrew') }} crew,
unnest(crew.directors) directors,
unnest(crew.writers) writers
