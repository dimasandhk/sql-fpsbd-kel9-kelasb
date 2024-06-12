CREATE VIEW detail_game AS
SELECT  
	game.title, genre.genre_name, developer.dev_name, game.release_date, game.ovr_reviews, game.price, game.description, game.age_rest,
    system_requirements.min_os, system_requirements.recom_os, system_requirements.min_processor, system_requirements.recom_processor,
    system_requirements.min_memory, system_requirements.recom_memory, system_requirements.min_graphics, system_requirements.recom_graphics,
    system_requirements.min_storage, system_requirements.recom_storage
FROM game 
JOIN developer ON developer.dev_id = game.dev_id 
JOIN system_requirements ON system_requirements.sysreq_id = game.sysreq_id
JOIN game_genres ON game_genres.game_id = game.game_id
JOIN genre ON genre.genre_id = game_genres.genre_id;

