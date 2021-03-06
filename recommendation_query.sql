-- 10 Songs from the user's most played genre that the user does not own.

SELECT song.title
FROM song
WHERE song.song_id IN
   (SELECT has_genre_song.song_id
   FROM has_genre_song
   WHERE has_genre_song.genre_type = (
       SELECT has_genre_song.genre_type
       FROM users,
            owns_song,
            song,
            has_genre_song
       WHERE users.user_id = owns_song.user_id
         AND owns_song.song_id = song.song_id
         AND song.song_id = has_genre_song.song_id
         AND users.user_id = {current user}
       GROUP BY has_genre_song.genre_type
       ORDER BY count(has_genre_song.genre_type) DESC
       LIMIT 1))
AND song.song_id NOT IN (
   SELECT owns_song.song_id
   FROM owns_song
   WHERE owns_song.user_id = {current user})
   LIMIT 10
