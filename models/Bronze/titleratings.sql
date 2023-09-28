select
ratings.tconst tconst,
ratings.averageRating averageRating,
ratings.numVotes
from {{ source('view_details', 'ratings') }} ratings
