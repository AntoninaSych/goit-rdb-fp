
ALTER TABLE infectious_data
    ADD COLUMN `current_date` DATE;

UPDATE infectious_data
SET `current_date` = CURDATE();

SELECT year, `current_date`
FROM infectious_data
    LIMIT 10;