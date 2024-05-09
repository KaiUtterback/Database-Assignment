create database MusicLibrary;

CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
);


CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);


CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    release_year INT,
    total_tracks INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- Adding a column for total duration in minutes to the Albums table
ALTER TABLE Albums ADD COLUMN duration INT;




-- sample data
INSERT INTO Artists (name, country) VALUES
('The Beatles', 'UK'),
('Taylor Swift', 'USA'),
('BTS', 'South Korea'),
('Adele', 'UK'),
('Drake', 'Canada');

INSERT INTO Genre (genre_name) VALUES
('Rock'),
('Pop'),
('K-Pop'),
('Soul'),
('Hip-Hop');

INSERT INTO Albums (title, artist_id, genre_id, release_year, total_tracks, duration) VALUES
('Abbey Road', 1, 1, 1969, 17, 47),
('1989', 2, 2, 2014, 13, 49),
('Map of the Soul: 7', 3, 3, 2020, 20, 74),
('25', 4, 4, 2015, 11, 48),
('Scorpion', 5, 5, 2018, 25, 90);

select * from artists;
select * from genre;
select * from albums;

-- Display albums along with artist name and genre
SELECT Albums.title, Albums.release_year, Albums.total_tracks, Albums.duration,
       Artists.name AS Artist, Genre.genre_name AS Genre
FROM Albums
JOIN Artists ON Albums.artist_id = Artists.artist_id
JOIN Genre ON Albums.genre_id = Genre.genre_id;