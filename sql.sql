-- Active: 1729714624695@@127.0.0.1@5432@for_miakd
CREATE TABLE genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE film(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    release_date DATE,
    age_limit INT,
    genre_id INT,
    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
        REFERENCES genre (id)
        ON DELETE CASCADE
);
INSERT INTO genre (name) VALUES
 ('Комедия'),
 ('Боевик'),
 ('Романтика'),
 ('Ужасы'),
 ('Фентези');
 DROP TABLE film;
 INSERT INTO film (name, release_date, age_limit, genre_id) VALUES
 ('Маска', '1994-07-29', 12, 1),
 ('1+1', '2011-09-21', 18, 1),
 ('Доктор Стрэндж', '2016-08-11', 18, 2),
 ('Аватар', '2009-08-18', 12, 2),
 ('С любовью, Рози', '2014-03-17', 18, 3),
 ('Гордость и предубеждение и зомби', '2016-04-18', 18, 3),
 ('Синистер', '2012-05-23', 18, 4),
 ('Солнцестояние', '2019-09-14', 18, 4),
 ('Алиса в стране чудес', '2010-05-16', 12, 5),
 ('Малефисента', '2014-08-14', 12, 5);
 COPY (SELECT xmlelement(
        name "genres", xmlagg(
            xmlelement(
                name "genre", 
                xmlforest(id AS "id", name AS "name")
                )
                )
                ) AS result_xml FROM genre) 
                TO 'C:\miakd\----2\genres.xml';
COPY (SELECT xmlelement(
        name "films", xmlagg(
            xmlelement(
                name "film", 
                xmlforest(id AS "id", name AS "name", release_date AS "release_date", age_limit AS "age_limit", genre_id AS "genre_id")
                )
                )
                ) AS result_xml FROM film) 
                TO 'C:\miakd\----2\films.xml';
CREATE INDEX idx_film_genre_id_hash ON film USING HASH (genre_id);
CREATE INDEX idx_genre_name_hash ON genre USING HASH (name);
CREATE INDEX idx_film_release ON film USING BTREE (release_date);
                