-- Cek trigger ovr_reviews
CALL WriteReview(4, 1, 'Great game, highly recommended!', 5);
SELECT title, ovr_reviews FROM game WHERE game_id = 1;

-- Cek trigger steam_wallet
CALL RecordGamePurchase(19, 14, 'Steam Wallet');

-- Cek trigger update_user_profile
CALL UpdateUserProfile(19, 'newusername', 'newemail', 'newpassword', '1999-01-01', 'newcountry');

-- Cek procedure PublishGame
CALL PublishGame(
    1, -- DevID
    'New Game Title', -- Title
    '2024-06-16', -- ReleaseDate
    'Positive', -- OvrReviews
    29.99, -- Price
    'This is a new game description.', -- Description
    18, -- AgeRest
    'Windows 10', -- MinOS
    'Windows 11', -- RecomOS
    'Intel i5', -- MinProcessor
    'Intel i7', -- RecomProcessor
    8, -- MinMemory
    16, -- RecomMemory
    'NVIDIA GTX 1050', -- MinGraphics
    'NVIDIA GTX 1660', -- RecomGraphics
    50, -- MinStorage
    100 -- RecomStorage
);
SELECT * FROM game WHERE title = 'New Game Title';