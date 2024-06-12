CREATE VIEW detail_game AS
SELECT  
    game.title, 
    genre.genre_name, 
    developer.dev_name, 
    game.release_date, 
    game.ovr_reviews, 
    printInt(CAST(game.price AS INT), 'price') AS formatted_price, 
    game.description, 
    game.age_rest,
    system_requirements.min_os, 
    system_requirements.recom_os, 
    system_requirements.min_processor, 
    system_requirements.recom_processor,
    printInt(system_requirements.min_memory, 'memory') AS formatted_min_memory, 
    printInt(system_requirements.recom_memory, 'memory') AS formatted_recom_memory, 
    system_requirements.min_graphics, 
    system_requirements.recom_graphics,
    printInt(system_requirements.min_storage, 'storage') AS formatted_min_storage, 
    printInt(system_requirements.recom_storage, 'storage') AS formatted_recom_storage
FROM game 
JOIN developer ON developer.dev_id = game.dev_id 
JOIN system_requirements ON system_requirements.sysreq_id = game.sysreq_id
JOIN game_genres ON game_genres.game_id = game.game_id
JOIN genre ON genre.genre_id = game_genres.genre_id;

