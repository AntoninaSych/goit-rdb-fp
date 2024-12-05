SELECT
    e.entity_name AS Entity,
    e.entity_code AS Code,
    AVG(d.number_rabies) AS average_rabies,
    MIN(d.number_rabies) AS min_rabies,
    MAX(d.number_rabies) AS max_rabies,
    SUM(d.number_rabies) AS sum_rabies
FROM
    infectious_data d
        JOIN
    entities e
    ON
        d.entity_id = e.id
WHERE
    d.number_rabies IS NOT NULL -- Фільтруємо непорожні значення
GROUP BY
    e.entity_name, e.entity_code
ORDER BY
    average_rabies DESC
    LIMIT 10; -- Обмежуємо до 10 рядків

SELECT * FROM infectious_data WHERE number_rabies IS NOT NULL LIMIT 10;