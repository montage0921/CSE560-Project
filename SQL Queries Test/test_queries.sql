-- Insertion --

INSERT INTO tv_movie
VALUES ('tt0111161','movie','The Shawshank Redemption','The Shawshank Redemption', true, 1994, NULL, 142)

INSERT INTO people
VALUES ('nm10025009','Yiwen Zhu', 1993, NULL)

-- Deletion --
DELETE FROM tv_movie
WHERE tconst = 'tt0111161'

DELETE FROM episode
WHERE tconst = 'tt0612823'

-- Update --
UPDATE title_aliases
SET "title" = '克隆戰爭'
WHERE titleId = 'tt0361243' and "ordering" = 35


Update ratings
SET averageRating = 8.0, numVotes = 19
WHERE tconst = 'tt35957962'


-------------------- -- Select -- ---------------------------------
-- Join -- 
-- Get Filmography of an actor/actrees
select primaryname, primarytitle 
from people p
natural join "Cast" c
natural join tv_movie tm
where p.primaryname = 'Aachi Manorama'

-- Order by --
-- select top 10 rating movies
SELECT tm.primarytitle, r.averagerating 
FROM tv_movie tm
natural join ratings r 
where r.numvotes > 10000 and (titleType = 'movie'  or titleType = 'tvMovie')
order by r.averagerating desc
limit 10

-- Group By --
-- Find Number of TV/Movie for each genres
SELECT g.genre, COUNT(*) AS movie_count
FROM tv_movie tm
NATURAL JOIN genres_movie gm
NATURAL JOIN genres g
GROUP BY g.genre
ORDER BY movie_count DESC

-- Subquery -- 
-- Find perfessionals that is good at certain generes
select dir_work.primaryname, diravg
from (select p.nconst, p.primaryname, avg(r.averagerating) as dirAvg
from crew c 
natural join tv_movie tm
natural join genres_movie gm 
natural join genres g
natural join ratings r
natural join people p
where c.category = 'director' and g.genre = 'Comedy' and p.deathYear is not NULL
group by p.nconst, p.primaryname
order by dirAvg desc) as dir_work
where dir_work.diravg > (select AVG(r.averagerating)
from tv_movie tm
natural join ratings r 
natural join genres g
natural join genres_movie gm
where g.genre = 'Comedy')


-- Find actor's famous work 
SELECT p.primaryname,
       ARRAY_AGG(DISTINCT tm.primarytitle) AS titles,
       ARRAY_AGG(DISTINCT g.genre) AS genres
FROM famous_work fw 
NATURAL JOIN "Cast" c 
NATURAL JOIN people p
NATURAL JOIN tv_movie tm
NATURAL JOIN genres_movie gm 
NATURAL JOIN genres g
GROUP BY p.primaryname;

 -- Find Movie/TV Statistics Based On Genre }
 SELECT g.genre, COUNT(*) AS movie_count, ROUND(AVG(r.averagerating)::numeric, 1)  as avg_ratings, ROUND(AVG(r.numvotes )::numeric) as avg_viewer
FROM tv_movie tm
NATURAL JOIN genres_movie gm
NATURAL JOIN genres g
natural join ratings r 
GROUP BY g.genre
ORDER BY movie_count DESC


-- Popularity of Work Over Time
SELECT 
  g.genre,
  (startyear / 10) * 10 AS decade,
  ROUND(AVG(r.averagerating )::numeric, 1) AS avg_rating,
  ROUND(AVG(r.numvotes)::numeric) AS avg_view_count
FROM tv_movie tm
NATURAL JOIN genres_movie gm
NATURAL JOIN genres g
NATURAL JOIN ratings r
WHERE startyear IS NOT NULL AND startyear >= 1900
GROUP BY g.genre, decade
ORDER BY decade, g.genre;











