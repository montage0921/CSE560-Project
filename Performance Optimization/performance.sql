-- Set up -- 
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

select * from pg_stat_statements

-- Problemtic Query 1 -- 
EXPLAIN ANALYZE  SELECT \* FROM episode where parenttconst = 'tt0165593'
CREATE INDEX idx_parenttconst ON episode USING hash (parenttconst);

-- Problemtic Query 2 -- 
EXPLAIN (ANALYZE, BUFFERS) select * from people p where p.primaryname  = 'Jiabao'

CREATE INDEX idx_name ON people(primaryname);

-- Problemtic Query 3
select tm.primarytitle, p2.primaryname from people p2
natural join profession_people pp 
natural join profession p
natural join crew c 
natural join tv_movie tm 
where profession_name = 'director' and p2.primaryname = 'Jiabao'

-- use the same index above idx_name to solve
