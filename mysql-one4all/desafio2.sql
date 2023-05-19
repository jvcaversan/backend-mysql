SELECT COUNT (song_id) AS cancoes,
COUNT (DISTINCT artist_id) AS artistas,
COUNT (DISTINCT album_id) as albuns

FROM SpotifyClone.songs_spotify;