DELIMITER //

CREATE TRIGGER ovr_reviews
AFTER INSERT ON review
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    -- Hitung rata-rata rating untuk game yang di-review
    SELECT AVG(rating) INTO avg_rating
    FROM review
    WHERE game_id = NEW.game_id;

    -- Tentukan nilai ovr_reviews berdasarkan rata-rata rating
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
