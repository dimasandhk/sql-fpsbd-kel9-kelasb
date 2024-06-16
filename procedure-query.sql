DELIMITER //

CREATE PROCEDURE UpdateGameInLibrary(
    IN LibID INT,
    IN TimePlayed INT
)
BEGIN
    UPDATE library
    SET last_played = NOW(), time_played = TimePlayed
    WHERE lib_id = LibID;
END //

DELIMITER ;

----------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE RecordGamePurchase(
    IN UserID INT,
    IN GameID INT,
    IN PaymentMethod ENUM('Steam Wallet', 'Debit', 'Credit', 'Paypal')
)
BEGIN
    INSERT INTO purchase (user_id, game_id, date_purchased, payment_method)
    VALUES (UserID, GameID, NOW(), PaymentMethod);

    -- Optionally add the game to the user's library with current date as last played
    INSERT INTO library (user_id, game_id, last_played, time_played)
    VALUES (UserID, GameID, NOW(), 0);
END //

DELIMITER ;

----------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE WriteReview(
    IN UserID INT,
    IN GameID INT,
    IN ReviewText VARCHAR(100),
    IN Rating INT
)
BEGIN
    INSERT INTO review (user_id, game_id, review_text, rating)
    VALUES (UserID, GameID, ReviewText, Rating);
END //

DELIMITER ;

----------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE UpdateUserProfile(
    IN UserID INT,
    IN NewUsername VARCHAR(100),
    IN NewEmail VARCHAR(100),
    IN NewPassword VARCHAR(100),
    IN NewDateOfBirth DATE,
    IN NewCountry VARCHAR(50)
)
BEGIN
    UPDATE user_steam
    SET 
        username = NewUsername,
        email = NewEmail,
        password = NewPassword,
        date_of_birth = NewDateOfBirth,
        country = NewCountry
    WHERE 
        user_id = UserID;
END //

DELIMITER ;