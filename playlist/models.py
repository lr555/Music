from django.db import models

# Create your models here.
class Playlist():
    def __init__(self,id,name,creator_id,created_time,labels, pic_path, creator = None):
        self.id = id
        self.name = name
        self.creator_id = creator_id
        self.created_time = created_time
        self.labels = labels
        self.pic_path = pic_path
        self.creator = creator

class Song():
    def __init__(self,id,name,album_id):
        self.id = id
        self.name = name
        self.album_id = album_id