-- Cek trigger ovr_reviews
CALL WriteReview(4, 1, 'Great game, highly recommended!', 5);
SELECT title, ovr_reviews FROM game WHERE game_id = 1;

-- Cek trigger steam_wallet
CALL RecordGamePurchase(19, 14, 'Steam Wallet');

-- Cek trigger update_user_profile
CALL UpdateUserProfile(19, 'newusername', 'newemail', 'newpassword', '1999-01-01', 'newcountry');