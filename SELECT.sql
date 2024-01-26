SELECT name FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

SELECT name FROM track
WHERE duration >= 210;

SELECT name FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name FROM musician WHERE name NOT LIKE '% %';

SELECT name FROM track WHERE name LIKE '%my%' or name LIKE '%мой%';

SELECT ge.name, COUNT(musician_id) FROM musician_genre mg
LEFT JOIN genre ge ON mg.genre_id = ge.id
GROUP BY ge.name;

SELECT COUNT(t.id) FROM track t
LEFT JOIN album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2018 AND 2020;

SELECT a.name, AVG(t.duration) FROM album a
LEFT JOIN track t  ON t.album_id = a.id
GROUP BY a.name;

SELECT m.name FROM musician m
LEFT JOIN album_musician am ON am.musician_id = m.id
LEFT JOIN album a ON am.album_id = a.id
WHERE a.release_year != 2020;


SELECT DISTINCT(c.name) FROM collection c
LEFT JOIN track_collection tc ON tc.collection_id = c.id
LEFT JOIN track t ON tc.track_id = t.id
LEFT JOIN album a ON t.album_id = a.id
LEFT JOIN album_musician am ON am.album_id = a.id
LEFT JOIN musician m ON am.musician_id = m.id
WHERE m.name LIKE 'Derek';