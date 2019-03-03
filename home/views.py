# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.db import connection
from . import models
import time


# Create your views here.
def home(request):
    content = {}
    content['is_login'] = request.session.get('is_login', None)
    content['artists'] = []
    content['albums'] = []
    content['playlists'] = []
    content['songs'] = []
    cursor = connection.cursor()
    # artist
    cursor.execute('''select * from  artist''')
    result = cursor.fetchall()
    if result:
        for i in range(len(result)):
            if i > 4:
                break
            row = result[i]
            content['artists'].append(models.Artist(row[0], row[1]))
    # album
    cursor.execute('''select * from  album NATURAL INNER JOIN artist ORDER by album_id''')
    result = cursor.fetchall()
    if result:
        for i in range(len(result)):
            if i > 4:
                break
            row = result[i]
            t = time.localtime(float(row[3]))
            publish_time = time.strftime("%Y-%m-%d", t)
            content['albums'].append(models.Album(
                row[1], row[2], publish_time, row[4], row[0], row[5]
            ))
    # playlist
    cursor.execute('''select playlist_id,playlist_name,
    creator_id,created_time,labels,playlist_pic_path,user_name 
    from playlist join users on creator_id = user_id
    where user_id != playlist_id;''')
    result = cursor.fetchall()
    if result:
        for i in range(len(result)):
            if i > 4:
                break
            row = result[i]
            t = time.localtime(float(row[3]))
            created_time = time.strftime("%Y-%m-%d", t)
            content['playlists'].append(models.Playlist(
                row[0], row[1], row[2], created_time, row[4], row[5], row[6]
            ))
    # songs
    cursor.execute('''select song_id,song_name,album_id,album_name,artist_id,artist_name 
      from artist_album_song
      where song_id % 2 = 1
      ORDER BY song_id''')
    result = cursor.fetchall()
    if result:
        for i in range(len(result)):
            if i > 9:
                break
            row = result[i]
            content['songs'].append(models.Song(row[0], row[1], row[2],row[3],row[4],row[5]))
    return render(request, 'home.html', content)
