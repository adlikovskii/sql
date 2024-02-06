INSERT INTO musician (name)
VALUES ('Abraham Black');

INSERT INTO musician (name)
VALUES ('Corey');

INSERT INTO musician (name)
VALUES ('Derek');

INSERT INTO musician (name)
VALUES ('Earl');

INSERT INTO genre (name)
VALUES ('Blues');

INSERT INTO genre (name)
VALUES ('Country');

INSERT INTO genre (name)
VALUES ('Electronic');

INSERT INTO musician_genre (musician_id, genre_id)
VALUES ('1', '1');

INSERT INTO musician_genre (musician_id, genre_id)
VALUES ('2', '1');

INSERT INTO musician_genre (musician_id, genre_id)
VALUES ('3', '2');

INSERT INTO musician_genre (musician_id, genre_id)
VALUES ('4', '3');

INSERT INTO album (release_year, name)
VALUES ('2019', 'Album 2019');

INSERT INTO album (release_year, name)
VALUES ('2020', 'Album 2020');

INSERT INTO album (release_year, name)
VALUES ('2021', 'Album 2021');

INSERT INTO album_musician (album_id, musician_id)
VALUES ('1', '1');

INSERT INTO album_musician (album_id, musician_id)
VALUES ('1', '2');

INSERT INTO album_musician (album_id, musician_id)
VALUES ('2', '3');

INSERT INTO album_musician (album_id, musician_id)
VALUES ('3', '4');

INSERT INTO track (album_id, duration, name)
VALUES ('1', '220', 'Track my sql');

INSERT INTO track (album_id, duration, name)
VALUES ('1', '230', 'Track my python');

INSERT INTO track (album_id, duration, name)
VALUES ('2', '300', 'Track my netology');

INSERT INTO track (album_id, duration, name)
VALUES ('2', '111', 'Sweet');

INSERT INTO track (album_id, duration, name)
VALUES ('3', '60', 'Second');

INSERT INTO track (album_id, duration, name)
VALUES ('3', '1', 'Small');

INSERT INTO collection (release_year, name)
VALUES ('2019', 'Best track 2019');

INSERT INTO collection (release_year, name)
VALUES ('2020', 'Top Hit Ever');

INSERT INTO collection (release_year, name)
VALUES ('2020', 'Best track 2020');

INSERT INTO collection (release_year, name)
VALUES ('2021', 'Best track 2021');

INSERT INTO track_collection (track_id, collection_id)
VALUES ('1', '1');

INSERT INTO track_collection (track_id, collection_id)
VALUES ('2', '1');

INSERT INTO track_collection (track_id, collection_id)
VALUES ('3', '2');

INSERT INTO track_collection (track_id, collection_id)
VALUES ('4', '3');

INSERT INTO track_collection (track_id, collection_id)
VALUES ('5', '4');

INSERT INTO track_collection (track_id, collection_id)
VALUES ('6', '4');