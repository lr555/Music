# -*- coding: UTF-8 -*-
from django.shortcuts import render
from django.db import connection
from . import models
import time


# Create your views here.
def album_index(request):
    content = {}
    content['is_login'] = request.session.get('is_login',None)
    content['albums'] = []
    cursor = connection.cursor()
    cursor.execute('''select * from album NATURAL INNER JOIN artist ORDER by album_id''')
    result = cursor.fetchall()
    if result:
        for row in result:
            t = time.localtime(float(row[3]))
            publish_time = time.strftime("%Y-%m-%d", t)
            content['albums'].append(models.Album(
                row[1], row[2], publish_time, row[4], row[0],row[5]
            ))
    return render(request, 'album_index.html', content)


def album_detail(request, id):
    content = {}
    content['is_login'] = request.session.get('is_login', None)
    cursor = connection.cursor()
    cursor.execute('''select * from album NATURAL INNER JOIN artist where album_id = {}'''.format(id))
    result = cursor.fetchone()
    if result:
        t = time.localtime(float(result[3]))
        publish_time = time.strftime("%Y-%m-%d", t)
        content['album']=models.Album(
            result[1], result[2], publish_time, result[4], result[0], result[5]
        )
    content['songs'] = []
    cursor.execute('''select song_id,song_name,artist_id,artist_name 
      from artist_album_song
      where album_id = {}'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            # print(row)
            content['songs'].append(models.Song(row[0], row[1], row[2], row[3]))
    return render(request, 'album_detail.html', content)
