DELIMITER $$

CREATE FUNCTION calculate_year_difference(input_year INT)
    RETURNS INT
    DETERMINISTIC
BEGIN
RETURN TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(input_year, '-01-01'), '%Y-%m-%d'), CURDATE());
END$$

DELIMITER ;


SELECT
    year,
    calculate_year_difference(year) AS year_difference
FROM
    infectious_data
WHERE
    year IS NOT NULL;


DELIMITER $$

CREATE FUNCTION calculate_disease_average(disease_count INT, period_divisor INT)
    RETURNS DECIMAL(10, 2)
    DETERMINISTIC
BEGIN
    IF period_divisor = 0 THEN
        RETURN NULL;
END IF;

RETURN disease_count / period_divisor;
END$$

DELIMITER ;
