from django.db import models

# Create your models here.
class Song():
    def __init__(self,id,name,album_id):
        self.id = id
        self.name = name
        self.album_id = album_id