SELECT user.name_song AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.songs_spotify AS user
INNER JOIN SpotifyClone.history_spotify AS history
ON user.song_id = history.song_id
GROUP BY user.song_id
ORDER BY reproducoes DESC,
cancao
LIMIT 2
;