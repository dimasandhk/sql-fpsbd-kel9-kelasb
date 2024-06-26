DELIMITER $$

CREATE FUNCTION printInt(val INT, int_type VARCHAR(100))
RETURNS VARCHAR(100)
BEGIN
    DECLARE result VARCHAR(100);

    IF int_type = "memory" THEN
        SET result = CONCAT("Memory: ", val, " GB");
    ELSEIF int_type = "storage" THEN
        SET result = CONCAT("Storage: ", val, " GB");
    ELSEIF int_type = "rating" THEN
        SET result = CONCAT(val, " out of 10");
    ELSEIF int_type = "time_played" THEN
        SET result = CONCAT(val, " hours");
    ELSEIF int_type = "price" THEN
        SET result = CONCAT("$", FORMAT(val, 2));
    ELSE
        SET result = CONCAT("Value: ", val);
    END IF;

    RETURN result;
END;
$$
DELIMITER ;

------------------------------------------------------------

DELIMITER $$

CREATE FUNCTION totalTimePlayed(inp_id INT) 
RETURNS INT
BEGIN
    DECLARE total_time INT;
    
    SELECT SUM(time_played) INTO total_time
    FROM library
    WHERE user_id = inp_id;
    
    RETURN IFNULL(total_time, 0);
END;
$$
DELIMITER ;

------------------------------------------------------------