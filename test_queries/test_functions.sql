-- Function to find professionals (except actors) by genere 
create function get_professionals_by_genre(target_genre VARCHAR(100), target_category VARCHAR(1000))
returns table(category VARCHAR(1000), genre VARCHAR(100),  primaryname VARCHAR(1000), avg_score float) as $$
begin
    return QUERY
    select target_category as category, g.genre, p.primaryname, avg(r.averageRating) as avg_score
    from crew c 
    natural join tv_movie tm
    natural join genres_movie gm 
    natural join genres g
    natural join ratings r
    natural join people p
    where c.category = target_category and g.genre = target_genre and p.deathYear is not NULL
    group by p.nconst, g.genre, p.primaryname
    having avg(r.averageRating) > (
        select AVG(r2.averagerating)
        from tv_movie tm2
        natural join ratings r2 
        natural join genres g2
        natural join genres_movie gm2
        where g2.genre = target_genre
    );
end;
$$ language plpgsql

-- Function: Find top X rating movies based on some standard
CREATE OR REPLACE FUNCTION top_works_by_genre(
    input_type VARCHAR(50), 
    input_genre VARCHAR(100), 
    limit_cnt INT
)
RETURNS TABLE(title VARCHAR(1000), rating FLOAT) AS $$
BEGIN
    IF input_type = 'movie' THEN
        RETURN QUERY
        SELECT tm.primarytitle, r.averagerating 
        FROM tv_movie tm
        NATURAL JOIN ratings r 
        NATURAL JOIN genres_movie gm
        NATURAL JOIN genres g
        WHERE r.numvotes > 10000 
          AND (tm.titletype = 'movie' OR tm.titletype = 'tvMovie')
          AND g.genre = input_genre
        ORDER BY r.averagerating DESC
        LIMIT limit_cnt;
    
    ELSIF input_type = 'tv' THEN
        RETURN QUERY
        SELECT tm.primarytitle, r.averagerating 
        FROM tv_movie tm
        NATURAL JOIN ratings r 
        NATURAL JOIN genres_movie gm
        NATURAL JOIN genres g
        WHERE r.numvotes > 10000 
          AND (tm.titletype = 'tvSeries' OR tm.titletype = 'tvMiniSeries')
          AND g.genre = input_genre
        ORDER BY r.averagerating DESC
        LIMIT limit_cnt;

    ELSE
        RETURN QUERY
        SELECT tm.primarytitle, r.averagerating 
        FROM tv_movie tm
        NATURAL JOIN ratings r 
        NATURAL JOIN genres_movie gm
        NATURAL JOIN genres g
        WHERE r.numvotes > 10000 
          AND g.genre = input_genre
        ORDER BY r.averagerating DESC
        LIMIT limit_cnt;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- Function to find actors/actress by genere 

