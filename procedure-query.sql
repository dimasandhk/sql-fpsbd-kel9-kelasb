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

----------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE PublishGame(
    IN DevID INT,
    IN Title VARCHAR(100),
    IN ReleaseDate DATE,
    IN OvrReviews ENUM('Very Positive', 'Positive', 'Mixed', 'Negative', 'Very Negative'),
    IN Price DECIMAL(10,2),
    IN Description TEXT,
    IN AgeRest INT,
    IN MinOS VARCHAR(100),
    IN RecomOS VARCHAR(100),
    IN MinProcessor VARCHAR(100),
    IN RecomProcessor VARCHAR(100),
    IN MinMemory INT,
    IN RecomMemory INT,
    IN MinGraphics VARCHAR(100),
    IN RecomGraphics VARCHAR(100),
    IN MinStorage INT,
    IN RecomStorage INT
)
BEGIN
    DECLARE SysReqID INT;
    DECLARE GameID INT;

    -- Insert system requirements
    INSERT INTO system_requirements (min_os, recom_os, min_processor, recom_processor, min_memory, recom_memory, min_graphics, recom_graphics, min_storage, recom_storage)
    VALUES (MinOS, RecomOS, MinProcessor, RecomProcessor, MinMemory, RecomMemory, MinGraphics, RecomGraphics, MinStorage, RecomStorage);

    -- Get the inserted system requirements ID
    SET SysReqID = LAST_INSERT_ID();

    -- Insert game details
    INSERT INTO game (dev_id, sysreq_id, title, release_date, ovr_reviews, price, description, age_rest)
    VALUES (DevID, SysReqID, Title, ReleaseDate, OvrReviews, Price, Description, AgeRest);

    -- Get the inserted game ID
    SET GameID = LAST_INSERT_ID();
END //

DELIMITER ;