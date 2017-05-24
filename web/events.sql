CREATE DATABASE events;
\c events

CREATE TABLE participant
(
	id SERIAL PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	name VARCHAR(100) NOT NULL
);

\d participant

CREATE TABLE race
(
	id SERIAL PRIMARY KEY,
	"date" DATE NOT NULL,
	distance VARCHAR(50),
	location VARCHAR(100),
	name VARCHAR(100) NOT NULL
);

CREATE TABLE enrollment
(
	id SERIAL PRIMARY KEY,
	participant_id INT NOT NULL REFERENCES participant(id),
	race_id INT NOT NULL REFERENCES race(id)
);

INSERT INTO participant(username, name) VALUES ('sburton', 'Scott Burton');