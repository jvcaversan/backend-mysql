SELECT artist.name_artist AS artista,
album.name_album AS album,
COUNT(follow.user_id) AS seguidores
FROM SpotifyClone.artist_spotify AS artist
INNER JOIN SpotifyClone.album_spotify as album
ON artist.artist_id = album.artist_id
RIGHT JOIN SpotifyClone.following_spotify AS follow
ON artist.artist_id = follow.artist_id
GROUP BY album.name_album, artist.name_artist
ORDER BY seguidores DESC, artista, album
;