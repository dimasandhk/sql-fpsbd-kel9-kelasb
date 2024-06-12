INSERT INTO user_steam (username, email, password, date_of_birth, balance, country) VALUES
('gamer1', 'gamer1@example.com', 'password1', '1990-01-01', 50.00, 'USA'),
('gamer2', 'gamer2@example.com', 'password2', '1992-02-02', 75.50, 'Canada'),
('gamer3', 'gamer3@example.com', 'password3', '1988-03-03', 100.00, 'UK'),
('gamer4', 'gamer4@example.com', 'password4', '1995-04-04', 200.00, 'Australia'),
('gamer5', 'gamer5@example.com', 'password5', '1998-05-05', 150.75, 'Germany'),
('gamer6', 'gamer6@example.com', 'password6', '1991-06-06', 120.20, 'France'),
('gamer7', 'gamer7@example.com', 'password7', '1993-07-07', 80.00, 'Japan');

INSERT INTO developer (dev_name) VALUES
('Valve'),
('CD Projekt Red'),
('Ubisoft'),
('Rockstar Games'),
('Bethesda'),
('Blizzard'),
('Epic Games');

INSERT INTO system_requirements (min_os, recom_os, min_processor, recom_processor, min_memory, recom_memory, min_graphics, recom_graphics, min_storage, recom_storage) VALUES
('Windows 7', 'Windows 10', 'Intel Core i3', 'Intel Core i5', 4, 8, 'NVIDIA GTX 660', 'NVIDIA GTX 970', 50, 100),
('Windows 8', 'Windows 10', 'AMD Ryzen 3', 'AMD Ryzen 5', 8, 16, 'AMD RX 560', 'AMD RX 580', 60, 120),
('Windows 7', 'Windows 10', 'Intel Core i5', 'Intel Core i7', 8, 16, 'NVIDIA GTX 750', 'NVIDIA GTX 1060', 40, 80),
('Windows 10', 'Windows 11', 'Intel Core i3', 'Intel Core i7', 8, 16, 'NVIDIA GTX 660', 'NVIDIA RTX 2060', 70, 150),
('Windows 8', 'Windows 10', 'Intel Core i5', 'Intel Core i9', 8, 16, 'NVIDIA GTX 760', 'NVIDIA GTX 1080', 55, 110),
('Windows 7', 'Windows 10', 'AMD Ryzen 5', 'AMD Ryzen 7', 8, 16, 'AMD RX 570', 'AMD RX 590', 65, 130),
('Windows 10', 'Windows 11', 'Intel Core i5', 'Intel Core i9', 16, 32, 'NVIDIA GTX 770', 'NVIDIA RTX 2070', 80, 160);

INSERT INTO genre (genre_name) VALUES
('Action'),
('Adventure'),
('RPG'),
('Strategy'),
('Simulation'),
('Sports'),
('Horror');

INSERT INTO game (dev_id, sysreq_id, title, release_date, ovr_reviews, price, description, age_rest) VALUES
(1, 1, 'Half-Life 2', '2004-11-16', 'Very Positive', 9.99, 'A first-person shooter game.', 17),
(2, 2, 'The Witcher 3', '2015-05-19', 'Very Positive', 29.99, 'An open-world RPG game.', 18),
(3, 3, 'Assassins Creed Valhalla', '2020-11-10', 'Positive', 59.99, 'An action role-playing game.', 17),
(4, 4, 'Grand Theft Auto V', '2013-09-17', 'Very Positive', 19.99, 'An action-adventure game.', 18),
(5, 5, 'The Elder Scrolls V: Skyrim', '2011-11-11', 'Very Positive', 39.99, 'An open-world action RPG game.', 17),
(6, 6, 'Overwatch', '2016-05-24', 'Positive', 39.99, 'A team-based multiplayer shooter.', 13),
(7, 7, 'Fortnite', '2017-07-25', 'Neutral', 0.00, 'A battle royale game.', 13);

INSERT INTO purchase (user_id, game_id, date_purchased, payment_method, payment_price) VALUES
(1, 1, '2024-01-01', 'Credit', 9.99),
(2, 2, '2024-02-01', 'Paypal', 29.99),
(3, 3, '2024-03-01', 'Steam Wallet', 59.99),
(4, 4, '2024-04-01', 'Debit', 19.99),
(5, 5, '2024-05-01', 'Credit', 39.99),
(6, 6, '2024-06-01', 'Steam Wallet', 39.99),
(7, 7, '2024-07-01', 'Paypal', 0.00);

INSERT INTO review (user_id, game_id, review_text, rating) VALUES
(1, 1, 'Amazing game, a classic!', 10),
(2, 2, 'One of the best RPGs ever!', 10),
(3, 3, 'Great gameplay and story.', 9),
(4, 4, 'Incredible open world.', 10),
(5, 5, 'Timeless classic.', 10),
(6, 6, 'Fun and competitive.', 8),
(7, 7, 'A fun free-to-play game.', 7);

INSERT INTO library (user_id, game_id, last_played, time_played) VALUES
(1, 1, '2024-06-01', 100),
(2, 2, '2024-06-02', 200),
(3, 3, '2024-06-03', 150),
(4, 4, '2024-06-04', 300),
(5, 5, '2024-06-05', 250),
(6, 6, '2024-06-06', 180),
(7, 7, '2024-06-07', 120);

INSERT INTO game_achievement (game_id, lib_id, received_date, achieve_desc, achieve_title) VALUES
(1, 1, '2024-06-01', 'Complete the first chapter.', 'First Chapter'),
(2, 2, '2024-06-02', 'Defeat the main boss.', 'Boss Defeated'),
(3, 3, '2024-06-03', 'Complete all side quests.', 'Side Quest Master'),
(4, 4, '2024-06-04', 'Reach 100% game completion.', 'Completionist'),
(5, 5, '2024-06-05', 'Craft 100 items.', 'Master Crafter'),
(6, 6, '2024-06-06', 'Win 50 matches.', 'Victory'),
(7, 7, '2024-06-07', 'Achieve level 50.', 'Level 50');

INSERT INTO game_genres (game_id, genre_id) VALUES
(1, 1),
(2, 3),
(3, 1),
(4, 1),
(5, 3),
(6, 1),
(7, 1);