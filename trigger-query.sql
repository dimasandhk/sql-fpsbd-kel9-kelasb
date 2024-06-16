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

-----------------------------------------------------

DELIMITER //

CREATE TRIGGER update_balance_after_purchase
AFTER INSERT ON purchase
FOR EACH ROW
BEGIN
    DECLARE game_price DECIMAL(10,2);

    -- Check if the payment method is 'Steam Wallet'
    IF NEW.payment_method = 'Steam Wallet' THEN
        -- Retrieve the game price
        SELECT price INTO game_price
        FROM game
        WHERE game.game_id = NEW.game_id;

        -- Update the user's balance
        UPDATE user_steam
        SET balance = balance - game_price
        WHERE user_id = NEW.user_id;
    END IF;
END //

DELIMITER ;

