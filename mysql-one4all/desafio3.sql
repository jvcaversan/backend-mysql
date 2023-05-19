SELECT user.name_user AS usuario,
COUNT(history.song_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(songs.duration_seconds/60),2) AS total_minutos
FROM SpotifyClone.spotify_user AS user
INNER JOIN
SpotifyClone.history_spotify AS history
ON history.user_id = user.user_id
INNER JOIN 
SpotifyClone.songs_spotify AS songs
ON history.song_id = songs.song_id
GROUP BY user.user_id
ORDER BY user.name_user
;