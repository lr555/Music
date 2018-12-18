from django.db import models


# Create your models here.
class Song():
    def __init__(self, id, name, album_id):
        self.id = id
        self.name = name
        self.album_id = album_id


class Artist():
    def __init__(self, id, name):
        self.id = id
        self.name = name


class Album():
    def __init__(self, id, name, publishtime, company, artist_id):
        self.id = id
        self.name = name
        self.publishtime = publishtime
        self.company = company
        self.artist_id = artist_id
