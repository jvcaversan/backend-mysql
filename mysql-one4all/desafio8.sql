SELECT artist.name_artist AS artista,
album.name_album AS album
FROM SpotifyClone.artist_spotify AS artist
INNER JOIN SpotifyClone.album_spotify as album
ON artist.artist_id = album.artist_id
GROUP BY album.name_album, artist.name_artist
HAVING artista = 'Elis Regina'
ORDER BY album
;