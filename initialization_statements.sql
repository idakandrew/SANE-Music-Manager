-- Artist table init.

create table artist
(
   artist_id serial not null
       constraint artist_pk primary key,
   artist_name varchar not null,
   dob date
);

-- Has_genre_song (song<> genre) relationship init.

create table has_genre_song
(
   song_id integer not null
       constraint song_genre_song_song_id_fk references song,
   genre_type varchar not null
       constraint song_genre_genre_genre_type_fk references genre
);

-- Has (song <> album <> track number) relationship init.

create table has
(
   song_id integer not null
       constraint belongs_to_song_song_id_fk references song,
   album_id integer not null
       constraint belongs_to_album_album_id_fk references album,
   track_number integer default 1 not null
);
