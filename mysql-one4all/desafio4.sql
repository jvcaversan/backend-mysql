SELECT user.name_user AS usuario,
IF(YEAR(MAX(history.date_reproduction)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.spotify_user AS user
INNER JOIN SpotifyClone.history_spotify AS history
ON user.user_id = history.user_id
GROUP BY history.user_id
ORDER BY name_user
;