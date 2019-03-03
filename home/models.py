from django.db import models


# Create your models here.
class Artist():
    def __init__(self, id, name):
        self.id = id
        self.name = name


class Album():
    def __init__(self, id, name, publishtime, company, artist_id,artist_name):
        self.id = id
        self.name = name
        self.publishtime = publishtime
        self.company = company
        self.artist_id = artist_id
        self.artist_name = artist_name


class Playlist():
    def __init__(self, id, name, creator_id, created_time, labels, pic_path, creator_name):
        self.id = id
        self.name = name
        self.creator_id = creator_id
        self.created_time = created_time
        self.labels = labels
        self.pic_path = pic_path
        self.creator_name = creator_name


class Song():
    def __init__(self, id, name,album_id, album_name, artist_id,artist_name):
        self.id = id
        self.name = name
        self.album_id =album_id
        self.album_name = album_name
        self.artist_id = artist_id
        self.artist_name = artist_name
