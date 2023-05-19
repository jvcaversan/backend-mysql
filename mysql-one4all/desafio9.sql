SELECT COUNT (*) AS quantidade_musicas_no_historico
FROM SpotifyClone.history_spotify as history
INNER JOIN SpotifyClone.spotify_user as user
ON history.user_id = user.user_id
GROUP BY user.name_user
HAVING user.name_user = 'Barbara Liskov'
;