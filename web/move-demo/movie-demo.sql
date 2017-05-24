CREATE DATABASE movies;
\c movies

CREATE TABLE movie
(
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	runtime SMALLINT,
	year SMALLINT NOT NULL
);

CREATE TABLE actor
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	birthday DATE,
	pictureUrl VARCHAR(255)
);

CREATE TABLE movieActor
(
	id SERIAL PRIMARY KEY,
	movieId INT NOT NULL REFERENCES movie(id),
	actorId INT NOT NULL REFERENCES actor(id),
	role VARCHAR(100)
);

INSERT INTO movie(title, runtime, year) VALUES ('Les Miserables', 160, 2012);
INSERT INTO movie(title, runtime, year) VALUES ('Nacho Libre', 92, 2006), ('Batman', NULL, 1966);

INSERT INTO actor(name, birthday, pictureUrl) VALUES ('Hugh Jackman', '1968-10-12', NULL);
INSERT INTO actor(name, birthday, pictureUrl) VALUES ('Adam West', NULL, NULL), ('Jack Black', NULL, NULL);
INSERT INTO actor(name, birthday, pictureUrl) VALUES ('Russell Crowe', NULL, NULL);

INSERT INTO movieActor(movieId, actorId) VALUES(1, 1);
INSERT INTO movieActor(movieId, actorId, role) VALUES(3, 2, 'Batman');
INSERT INTO movieActor(movieId, actorId, role) VALUES(1, 4, 'Javier');

# Find all the actor in Les Miserables
SELECT a.name, ma.role FROM movie m
  JOIN movieActor ma ON m.id = ma.movieId
  JOIN actor a ON ma.actorId = a.id
  WHERE m.title = 'Les Miserables';

CREATE USER the_critic WITH PASSWORD 'password1';
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO the_critic;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO the_critic;







