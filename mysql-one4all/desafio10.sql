SELECT try1.name_song AS nome,
COUNT(*) AS reproducoes
FROM SpotifyClone.spotify_user AS try2
INNER JOIN SpotifyClone.spotify_plan AS try3
ON try2.plan_id = try3.plan_id
INNER JOIN SpotifyClone.history_spotify AS try4
ON try4.user_id = try2.user_id
INNER JOIN SpotifyClone.songs_spotify AS try1
ON try1.song_id = try4.song_id
GROUP BY try1.name_song, try3.name_plan
HAVING try3.name_plan IN('gratuito', 'pessoal')
ORDER BY nome
;