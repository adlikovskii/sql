CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Musician (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Musician_Genre (
	genre_id INTEGER REFERENCES Genre(id),
	musician_id INTEGER REFERENCES Musician(id),
	PRIMARY KEY (genre_id, musician_id)
);
CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	release_year INTEGER NOT NULL,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Album_Musician (
	album_id INTEGER REFERENCES Album(id),
	musician_id INTEGER REFERENCES Musician(id),
    PRIMARY KEY (album_id, musician_id)
);
CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES Album(id),
	duration INTEGER NOT NULL,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	release_year INTEGER NOT NULL,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Track_Collection (
	collection_id INTEGER REFERENCES Collection(id),
	track_id INTEGER REFERENCES Track(id),
	PRIMARY KEY (collection_id, track_id)
);