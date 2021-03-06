-- Add song to user's library.

insert into owns_song (user_id, song_id, play_count) values (<user_id>, <song_id>, 0);

-- Add new user with new ID.

insert into users (user_id) values (<id>);

-- Populate time_records with random num of random play timestamps (within past few months) for random num of songs per user.

do $$
declare x int;
begin
   for i in 1..6 loop
       for j in 1..(random() * 60) loop
           x := random() * 4982;
           for k in 1..(random() * 15) loop
               insert into time_records(time_stamp, song_id, user_id)
              	 select NOW() - (random() * (NOW()+'90	days' - NOW())), x, i;
           end loop;
       end loop;
   end loop;
end
$$

-- Populate owns_song by counting play timestamps for each song + user pair in time_records.

do $$
begin
   for i in 1..6 loop
       insert into owns_song(user_id, song_id, play_count)
          select i, song_id, count(song_id) from time_records where user_id = i group by song_id;
   end loop;
end;
$$
