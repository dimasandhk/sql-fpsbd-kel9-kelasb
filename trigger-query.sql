DELIMITER //

CREATE TRIGGER ovr_reviews
AFTER INSERT ON review
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    SELECT AVG(rating) INTO avg_rating
    FROM review
    WHERE game_id = NEW.game_id;

    IF avg_rating >= 4.5 THEN
        UPDATE game
        SET ovr_reviews = 'Very Positive'
        WHERE game_id = NEW.game_id;
    ELSEIF avg_rating >= 3.5 THEN
        UPDATE game
        SET ovr_reviews = 'Positive'
        WHERE game_id = NEW.game_id;
    ELSEIF avg_rating >= 3.0 THEN
        UPDATE game
        SET ovr_reviews = 'Mixed'
        WHERE game_id = NEW.game_id;
    ELSEIF avg_rating >= 2.1 THEN
        UPDATE game
        SET ovr_reviews = 'Negative'
        WHERE game_id = NEW.game_id;
    ELSE
        UPDATE game
        SET ovr_reviews = 'Very Negative'
        WHERE game_id = NEW.game_id;
    END IF;
END//

DELIMITER ;

-----------------------------------------------------

DELIMITER //

CREATE TRIGGER set_ovr_reviews_null
BEFORE INSERT ON game
FOR EACH ROW
BEGIN
    SET NEW.ovr_reviews = NULL;
END//

DELIMITER ;
