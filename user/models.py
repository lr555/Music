from django.db import models

# Create your models here.


class Playlist():
    def __init__(self, id, name, creator_id, created_time, labels, pic_path, creator=None, count=0):
        self.id = id
        self.name = name
        self.creator_id = creator_id
        self.created_time = created_time
        self.labels = labels
        self.pic_path = pic_path
        self.creator = creator
        self.count = count

class Song():
    def __init__(self, song_id, song_name, album_id, album_name, artist_id, artist_name):
        self.song_id = song_id
        self.song_name = song_name
        self.album_id = album_id
        self.album_name = album_name
        self.artist_id = artist_id
        self.artist_name = artist_name

class User():
    def __init__(self, id, name):
       self.id = id
       self.name = name
