from django.shortcuts import render
from django.db import connection
from . import models
import time

# Create your views here.
def playlist_index(request):
    content = {}
    content['playlists'] = []
    cursor = connection.cursor()
    cursor.execute('''select playlist_id,playlist_name,
    creator_id,created_time,labels,playlist_pic_path,user_name 
    from playlist join users on creator_id = user_id
    where user_id != playlist_id;''')
    result = cursor.fetchall()
    if result:
        for row in result:
            t = time.localtime(float(row[3]))
            created_time = time.strftime("%Y-%m-%d", t)
            content['playlists'].append(models.Playlist(
                row[0],row[1],row[2],created_time,row[4],row[5],row[6]
            ))
    return render(request, 'playlist_index.html', content)

def playlist_detail(request, id):
    content = {}
    cursor = connection.cursor()
    cursor.execute('''select playlist_id,playlist_name,
    creator_id,created_time,labels,playlist_pic_path,user_name 
    from playlist join users on creator_id = user_id 
    where playlist_id = {};'''.format(id))
    result = cursor.fetchone()
    if result:
        t = time.localtime(float(result[3]))
        created_time = time.strftime("%Y-%m-%d", t)
        content['playlist'] = models.Playlist(
                result[0],result[1],result[2],created_time,result[4],result[5],result[6]
        )

    content['songs'] = []
    cursor.execute('''select song_id,song_name,album_id
    from playlist natural join song_playlist natural join song
    where playlist_id = {};'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            content['songs'].append(models.Song(row[0],row[1],row[2]))
    return render(request, 'playlist_detail.html', content)