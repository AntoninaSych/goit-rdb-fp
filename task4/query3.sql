ALTER TABLE infectious_data
    ADD COLUMN year_difference INT;
UPDATE infectious_data
SET year_difference = TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d'), CURDATE())
WHERE year IS NOT NULL;

SELECT year, start_of_year, `current_date`, year_difference   FROM infectious_data limit 10