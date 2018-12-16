# -*- coding: UTF-8 -*-
from django.shortcuts import render
from django.db import connection
from . import models
import time

# Create your views here.
def album_index(request):
    content = {}
    content['albums'] = []
    cursor = connection.cursor()
    cursor.execute('''select * from  album''')
    result = cursor.fetchall()
    if result:
        for row in result:
            t = time.localtime(float(row[2]))
            publish_time = time.strftime("%Y-%m-%d", t)
            content['albums'].append(models.Album(
                row[0],row[1],publish_time,row[3],row[4]
            ))
    return render(request, 'album_index.html', content)

def album_detail(request, id):
    content = {}
    cursor = connection.cursor()
    cursor.execute('''select * from  album where album_id = {}'''.format(id))
    result = cursor.fetchone()
    if result:
        t = time.localtime(float(result[2]))
        publish_time = time.strftime("%Y-%m-%d", t)
        content['album']= models.Album(
            id, result[1], publish_time, result[3], result[4]
        )

    content['songs'] = []
    cursor.execute('''select * from song 
        where song.album_id = {}'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            # print(row)
            content['songs'].append(models.Song(row[0],row[1],row[2]))
    return render(request, 'album_detail.html', content)