# -*- coding: UTF-8 -*-
from django.shortcuts import render
from django.db import connection
from . import models
import time

# Create your views here.
def artist_index(request):
    content = {}
    content['artists'] = []
    cursor = connection.cursor()
    cursor.execute('''select * from  artist''')
    result = cursor.fetchall()
    if result:
        for row in result:
            # print(type(row[0]))
            content['artists'].append(models.Artist(row[0],row[1]))
    return render(request, 'artist_index.html', content)

def artist_detail(request, id):
    content = {}
    cursor = connection.cursor()
    cursor.execute('''select * from  artist where artist_id = {}'''.format(id))
    result = cursor.fetchone()
    if result:
        content['artist'] = models.Artist(id, result[1])

    content['albums'] = []
    cursor.execute('''select * from album 
        where album.artist_id = {}'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            t = time.localtime(float(row[2]))
            publish_time = time.strftime("%Y-%m-%d", t)
            content['albums'].append(models.Album(
                row[0],row[1],publish_time,row[3],row[4]
            ))
    return render(request, 'artist_detail.html', content)


