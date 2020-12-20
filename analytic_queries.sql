-- Mean album length in user library.

SELECT avg(sum_len)
FROM
(SELECT sum(song.length) AS sum_len
FROM song, users, owns_album, has, album
WHERE users.user_id = {current user} AND users.user_id = owns_album.user_id
AND owns_album.album_id = album.album_id
AND album.album_id = has.album_id AND has.song_id = song.song_id
GROUP BY album.album_name) AS abc

-- Mean length of individual songs in user library.

SELECT ceil(avg(song.length)) AS avg_length
FROM users, owns_song, song
WHERE users.user_id = owns_song.user_id AND owns_song.song_id = song.song_id
AND users.user_id = {current user}

-- Current user's 5 most owned genres.

SELECT has_genre_song.genre_type, count(has_genre_song.genre_type)
FROM users, owns_song, song, has_genre_song
WHERE users.user_id = owns_song.user_id AND owns_song.song_id = song.song_id AND
song.song_id = has_genre_song.song_id AND users.user_id = {current user}
GROUP BY has_genre_song.genre_type
ORDER BY count(has_genre_song.genre_type) DESC
LIMIT 5

-- Current user's 5 most played artists.

SELECT artist.artist_name, count(artist.artist_id)
FROM users, owns_song, song, created_by, artist
WHERE users.user_id = owns_song.user_id AND owns_song.song_id = song.song_id AND
song.song_id = created_by.song_id AND created_by.artist_id = artist.artist_id AND owns_song.play_count > 0
AND users.user_id = {current user}
GROUP BY artist.artist_name
ORDER BY count(artist.artist_id) DESC
LIMIT 5

-- Current user's 5 most played songs.

SELECT song.title, owns_song.play_count
FROM users, owns_song, song
WHERE users.user_id = owns_song.user_id AND owns_song.song_id = song.song_id
AND users.user_id = {current user}
ORDER BY owns_song.play_count DESC
LIMIT 5

-- Current user's 5 most played genres.

SELECT has_genre_song.genre_type, count(has_genre_song.genre_type)
FROM users, owns_song, song, has_genre_song
WHERE users.user_id = owns_song.user_id AND owns_song.song_id = song.song_id AND
song.song_id = has_genre_song.song_id AND users.user_id = {current user} AND owns_song.play_count > 0
GROUP BY has_genre_song.genre_type
ORDER BY count(has_genre_song.genre_type) DESC
LIMIT 5

-- Genre ownership totals amongst all users.

SELECT has_genre_song.genre_type, count(has_genre_song.genre_type)
FROM users, owns_song, song, has_genre_song
WHERE users.user_id = owns_song.user_id AND owns_song.song_id = song.song_id AND
song.song_id = has_genre_song.song_id
GROUP BY has_genre_song.genre_type
ORDER BY count(has_genre_song.genre_type) DESC
