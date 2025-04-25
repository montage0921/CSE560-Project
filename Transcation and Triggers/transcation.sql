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
EXECUTE FUNCTION log_invalid_rating()

CREATE TRIGGER validate_rating_update_trigger
BEFORE UPDATE ON ratings
FOR EACH ROW
WHEN (NEW.averageRating < 0 OR NEW.averageRating > 10)
EXECUTE FUNCTION log_invalid_rating()

-- Transcation --
BEGIN;

UPDATE ratings
SET averageRating = 89,
    numVotes = 12000
WHERE tconst = 'tt9999999';

UPDATE ratings
SET averageRating = 7.9,
    numVotes = 12000
WHERE tconst = 'tt9999999';

COMMIT;