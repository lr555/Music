# -*- coding: UTF-8 -*-
from django.shortcuts import render
from django.db import connection
from . import models
from django.http import HttpResponse
import time


# Create your views here.
def song_detail(request, id):
    content = {}
    cursor = connection.cursor()
    cursor.execute('''select * from song where song_id = {}'''.format(id))
    result = cursor.fetchall()
    if result:
        row = result[0]
        content['song'] = models.Song(row[0], row[1], row[2])
        album_id = row[2]

    # cursor.execute('''select artist_id from album where album_id = {}'''.format(album_id))
    # result = cursor.fetchall()
    # if result:
    # 	artist_id = result[0][0]

    cursor.execute('''select * from album where album_id = {}'''.format(album_id))
    result = cursor.fetchall()
    if result:
        row = result[0]
        t = time.localtime(float(row[2]))
        publish_time = time.strftime("%Y-%m-%d", t)
        content['album'] = models.Album(row[0], row[1], publish_time, row[3], row[4])
        artist_id = row[4]

    cursor.execute('''select * from artist where artist_id = {}'''.format(artist_id))
    result = cursor.fetchall()
    if result:
        row = result[0]
        content['artist'] = models.Artist(row[0], row[1])

    return render(request, 'song_detail.html', content)
