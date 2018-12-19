from django.db import models

# Create your models here.


class Song():
    def __init__(self, song_id, song_name, album_id, album_name, artist_id, artist_name):
        self.song_id = song_id
        self.song_name = song_name
        self.album_id = album_id
        self.album_name = album_name
        self.artist_id = artist_id
        self.artist_name = artist_name
