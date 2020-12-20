-- Find song from GUI search function.

select song.* from song where lower(song.title) like '%<search>%';

-- Find album from GUI search function.

select album.* from album where lower(album_name) like '%<search>%';

-- Select user based on given ID.

select * from users where user_id=<id>;
