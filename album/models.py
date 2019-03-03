from django.db import models


# Create your models here.
class Album():
    def __init__(self, id, name, publishtime, company, artist_id,artist_name=None):
        self.id = id
        self.name = name
        self.publishtime = publishtime
        self.company = company
        self.artist_id = artist_id
        self.artist_name = artist_name


class Song():
    def __init__(self, id, name, artist_id,artist_name):
        self.id = id
        self.name = name
        self.artist_id = artist_id
        self.artist_name = artist_name
