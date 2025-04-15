CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Not use
select * from pg_stat_statements

-- Check planning time
EXPLAIN ANALYZE (select * from episode)
