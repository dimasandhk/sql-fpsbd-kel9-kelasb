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

----------------------------------------------------------------------------------------------

CREATE VIEW `adult_rating` AS
SELECT 
    g.title AS game_title,
    d.dev_name AS developer_name,
    g.release_date,
    g.ovr_reviews,
    printInt(CAST(g.price AS INT), 'price') AS formatted_price,
    g.description,
    sr.min_os,
    sr.min_processor,
    printInt(sr.min_memory, 'memory') AS formatted_min_memory, 
    sr.min_graphics,
    printInt(sr.min_storage, 'storage') AS formatted_min_storage,
    GROUP_CONCAT(DISTINCT gen.genre_name ORDER BY gen.genre_name ASC SEPARATOR ', ') AS genres
FROM 
    game g
JOIN 
    developer d ON g.dev_id = d.dev_id
JOIN 
    system_requirements sr ON g.sysreq_id = sr.sysreq_id
JOIN 
    game_genres gg ON g.game_id = gg.game_id
JOIN 
    genre gen ON gg.genre_id = gen.genre_id
WHERE 
    g.age_rest = 18
GROUP BY 
    g.game_id, 
    g.title, 
    d.dev_name, 
    g.release_date, 
    g.ovr_reviews, 
    g.price, 
    g.description, 
    sr.min_os, 
    sr.min_processor, 
    sr.min_memory, 
    sr.min_graphics, 
    sr.min_storage;
