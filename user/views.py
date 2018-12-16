from django.shortcuts import render
from django.shortcuts import render
from django.db import connection
from . import models
import time
# Create your views here.


def user_songs(request, id):
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
            result[0], result[1], result[2], created_time, result[4], result[5], result[6]
        )

    content['songs'] = []
    content['user'] = []
    cursor.execute('''select song_id,song_name,album_id,album_name,artist_id,artist_name
    from playlist natural join song_playlist natural join song natural join album natural join artist
    where playlist_id = {};'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            content['songs'].append(models.Song(row[0], row[1], row[2],row[3], row[4], row[5]))
    cursor_user = connection.cursor()
    cursor_user.execute('''select * from users where user_id = {}'''.format(id))
    result2 = cursor_user.fetchall()
    if result2:
        for row in result2:
            content['user'].append(models.User(row[0], row[1]))
    return render(request, 'user_songs.html', content)


def user_playlist(request,id):
    content = {}
    content['playlists'] = []
    content['user'] = []
    cursor = connection.cursor()
    cursor.execute('''select playlist.playlist_id,playlist_name,
    creator_id,created_time,labels,playlist_pic_path,user_name 
    from playlist,users,user_playlist
    where user_playlist.user_id = users.user_id and 
    playlist.playlist_id = user_playlist.playlist_id and 
    users.user_id = {};'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            t = time.localtime(float(row[3]))
            created_time = time.strftime("%Y-%m-%d", t)
            content['playlists'].append(models.Playlist(
                row[0], row[1], row[2], created_time, row[4], row[5], row[6]
            ))
    cursor_user = connection.cursor()
    cursor_user.execute('''select * from users where user_id = {}'''.format(id))
    result2 = cursor_user.fetchall()
    if result2:
        for row in result2:
            content['user'].append(models.User(row[0],row[1]))
    for each in content['playlists']:
        cursor_count = connection.cursor()
        cursor_count.execute('''select count(song_id) from song_playlist where playlist_id={}'''.format(each.id))
        temp = cursor_count.fetchall()
        each.count = temp[0][0]
    return render(request, 'user_playlist.html', content)
