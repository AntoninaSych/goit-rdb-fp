CREATE TABLE entities (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          entity_name VARCHAR(255) NOT NULL,
                          entity_code VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE infectious_data (
                                 id INT AUTO_INCREMENT PRIMARY KEY,
                                 entity_id INT NOT NULL,
                                 year INT NOT NULL,
                                 number_rabies INT,
                                 number_malaria INT,
                                 FOREIGN KEY (entity_id) REFERENCES entities(id)
);

INSERT INTO entities (entity_name, entity_code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

INSERT INTO infectious_data (entity_id, year, number_rabies, number_malaria)
SELECT e.id, ic.Year,
       NULLIF(ic.Number_rabies, '') AS number_rabies,
       NULLIF(ic.Number_malaria, '') AS number_malaria
FROM infectious_cases ic
         JOIN entities e
              ON ic.Entity = e.entity_name AND ic.Code = e.entity_code;

SELECT * FROM entities LIMIT 10;

SELECT * FROM infectious_data LIMIT 100;