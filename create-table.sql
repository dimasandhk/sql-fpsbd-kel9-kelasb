CREATE TABLE user_steam (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    balance DECIMAL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE developer (
    dev_id INT AUTO_INCREMENT PRIMARY KEY,
    dev_name VARCHAR(100) NOT NULL
);

CREATE TABLE system_requirements (
    sysreq_id INT AUTO_INCREMENT PRIMARY KEY,
    min_os VARCHAR(100) NOT NULL,
    recom_os VARCHAR(100) NOT NULL,
    min_processor VARCHAR(100) NOT NULL,
    recom_processor VARCHAR(100) NOT NULL,
    min_memory INT NOT NULL,
    recom_memory INT NOT NULL,
    min_graphics VARCHAR(100) NOT NULL,
    recom_graphics VARCHAR(100) NOT NULL,
    min_storage INT NOT NULL,
    recom_storage INT NOT NULL
);

CREATE TABLE genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE game (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    dev_id INT,
    sysreq_id INT,
    title VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    ovr_reviews ENUM('Very Positive', 'Positive', 'Mixed', 'Negative', 'Very Negative'),
    price DECIMAL NOT NULL,
    description TEXT NOT NULL,
    age_rest INT NOT NULL,
    FOREIGN KEY (dev_id) REFERENCES developer(dev_id),
    FOREIGN KEY (sysreq_id) REFERENCES system_requirements(sysreq_id)
);

CREATE TABLE purchase (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    game_id INT,
    date_purchased DATE NOT NULL,
    payment_method ENUM('Steam Wallet', 'Debit', 'Credit', 'Paypal') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_steam(user_id),
    FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    game_id INT,
    review_text VARCHAR(100) NOT NULL,
    rating INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_steam(user_id),
    FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE library (
    lib_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    game_id INT,
    last_played DATE NOT NULL,
    time_played INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_steam(user_id),
    FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE game_achievement (
    achieve_id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT,
    achieve_desc VARCHAR(100) NOT NULL,
    achieve_title VARCHAR(100) NOT NULL,
    FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE user_achievement (
	lib_id INT,
    achieve_id INT,
    received_date DATE NOT NULL,
    PRIMARY KEY (lib_id, achieve_id),
    FOREIGN KEY (lib_id) REFERENCES library(lib_id),
    FOREIGN KEY (achieve_id) REFERENCES game_achievement(achieve_id)
);

CREATE TABLE game_genres (
    game_id INT,
    genre_id INT,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES game(game_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);
