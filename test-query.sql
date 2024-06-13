-- Cek trigger ovr_reviews
INSERT INTO review (user_id, game_id, review_text, rating)
VALUES (4, 1, 'What a masterpiece!!!!!', 5);

SELECT title, ovr_reviews FROM game WHERE game_id = 1;
