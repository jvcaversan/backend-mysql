DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.spotify_plan(
	plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name_plan VARCHAR(15) NOT NULL,
  value_plan DECIMAL(4,2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.spotify_user(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_user VARCHAR(50) NOT NULL,
    age_user INT NOT NULL,
    plan_id INTEGER NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.spotify_plan (plan_id),
    date_assignment DATE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.artist_spotify(
	artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name_artist VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.album_spotify(
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name_album VARCHAR(50) NOT NULL,
  artist_id INTEGER NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist_spotify (artist_id),
  release_year YEAR NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.songs_spotify(
	song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name_song VARCHAR(50) NOT NULL,
  artist_id INTEGER NOT NULL,
  album_id INTEGER NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist_spotify (artist_id),
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album_spotify (album_id),
	duration_seconds INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.following_spotify(
	user_id INTEGER NOT NULL,
  artist_id INTEGER NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist_spotify (artist_id),
	FOREIGN KEY (user_id) REFERENCES SpotifyClone.spotify_user (user_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.history_spotify(
	user_id INTEGER NOT NULL,
  song_id INTEGER NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, song_id),
	FOREIGN KEY (user_id) REFERENCES SpotifyClone.spotify_user (user_id),
	FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs_spotify (song_id),
  date_reproduction DATETIME NOT NULL
) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.spotify_plan (name_plan, value_plan)
  VALUES
    ('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.spotify_user (name_user, age_user, date_assignment, plan_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 4),
    ('Martin Fowler', 46, '2017-01-17', 4),
    ('Sandi Metz', 58, '2018-04-29', 4),
    ('Paulo Freire', 19, '2018-02-14', 2),
    ('Bell Hooks', 26, '2018-01-05', 2),
    ('Christopher Alexander', 85, '2019-06-05', 3),
    ('Judith Butler', 45, '2020-05-13', 3),
    ('Jorge Amado', 58, '2017-02-17', 3);

  INSERT INTO SpotifyClone.artist_spotify (name_artist)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.album_spotify (name_album, artist_id, release_year)
  VALUES
    ('Renaissance', 1, '2022'),
    ('Jazz', 2, '1978'),
    ('Hot Space', 2, '1982'),
    ('Falso Brilhante', 3, '1998'),
    ('Vento de Maio', 3, '2001'),
    ('QVVJFA?', 4, '2003'),
    ('Somewhere Far Beyond', 5, '2007'),
    ('I Put A Spell On You', 6, '2012');

  INSERT INTO SpotifyClone.songs_spotify (name_song, duration_seconds, album_id, artist_id)
  VALUES 
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    ('Samba em Paris', 267, 6, 4),
    ('The Bard’s Song', 244, 7, 5),
    ('Feeling Good', 100, 8, 6);

  INSERT INTO SpotifyClone.following_spotify (user_id, artist_id)
  VALUES
   (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

    INSERT INTO SpotifyClone.history_spotify (user_id, song_id, date_reproduction)
    VALUES
   (1, 8, '2022-02-28 10:45:55'), 
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'), 
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'), 
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'), 
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');