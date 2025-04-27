-- Error Function --
CREATE OR REPLACE FUNCTION log_invalid_rating()
RETURNS TRIGGER AS $$
BEGIN
    RAISE EXCEPTION 'Invalid rating %. Must be between 0 and 10.', NEW.averageRating;
END;
$$ LANGUAGE plpgsql;


-- Trigger Functions --
CREATE TRIGGER validate_rating_trigger
BEFORE INSERT ON ratings
FOR EACH ROW
WHEN (NEW.averageRating < 0 OR NEW.averageRating > 10)
EXECUTE FUNCTION log_invalid_rating();

CREATE TRIGGER validate_rating_update_trigger
BEFORE UPDATE ON ratings
FOR EACH ROW
WHEN (NEW.averageRating < 0 OR NEW.averageRating > 10)
EXECUTE FUNCTION log_invalid_rating();

-- Transcation Fail 1 --
BEGIN;

UPDATE ratings
SET averageRating = 8.1,
    numVotes = 12000
WHERE tconst = 'tt0000862';

UPDATE ratings
SET averageRating = 79,
    numVotes = 1200
WHERE tconst = 'tt9999999';

COMMIT;

-- Transcation Fail 2 --
BEGIN;

UPDATE ratings
SET averageRating = 81,
    numVotes = 12000
WHERE tconst = 'tt0000862';

UPDATE ratings
SET averageRating = 7.9,
    numVotes = 1200
WHERE tconst = 'tt9999999';

COMMIT;

-- Transaction Fail 3 --
BEGIN;

UPDATE ratings
SET averageRating = 8.1,
    numVotes = 20
WHERE tconst = 'tt9999999';

UPDATE ratings
SET averageRating = 79,
    numVotes = 1200
WHERE tconst = 'tt9999999';

COMMIT;

-- Transaction Success --
BEGIN;

UPDATE ratings
SET averageRating = 8.1,
    numVotes = 20
WHERE tconst = 'tt9999999';

UPDATE ratings
SET averageRating = 7.9,
    numVotes = 12000
WHERE tconst = 'tt9999999';

COMMIT;

-- Check Transaction --
select *
from ratings as r
where tconst = 'tt9999999' or tconst = 'tt0000862'


