from django.shortcuts import render
from django.shortcuts import render, redirect,reverse
from django.db import connection
from . import models
import time


# Create your views here.
def get_user_name(id):
    cursor_user = connection.cursor()
    cursor_user.execute('''select * from users where user_id = {}'''.format(id))
    result = cursor_user.fetchone()
    return result[1]

def user_songs(request, id, name=None):
    content = {}
    content['is_login'] = request.session.get('is_login', None)
    if not name:
        name = get_user_name(id)
    content['user'] = models.User(id, name)
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
    cursor.execute('''select song_id,song_name,album_id,album_name,artist_id,artist_name
    from playlist natural join song_playlist natural join song natural join album natural join artist
    where playlist_id = {};'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            content['songs'].append(models.Song(row[0], row[1], row[2],row[3], row[4], row[5]))
    return render(request, 'user_songs.html', content)


def user_playlist(request,id,name=None):
    content = {}
    content['is_login'] = request.session.get('is_login', None)
    if not name:
        name = get_user_name(id)
    content['user'] = models.User(id, name)
    content['playlists'] = []
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
    for each in content['playlists']:
        cursor_count = connection.cursor()
        cursor_count.execute('''select count(song_id) from song_playlist where playlist_id={}'''.format(each.id))
        temp = cursor_count.fetchall()
        each.count = temp[0][0]
    return render(request, 'user_playlist.html', content)

def alert_login(request):
    if not request.session.get('is_login',None):
        request.session['message'] = '请先登录'
        return True
    else:
        return False

def my_songs(request):
    if alert_login(request):
        return redirect('/login/')
    user_id = request.session['user_id']
    user_name = request.session['user_name']
    return user_songs(request,user_id,user_name)

def my_playlist(request):
    if alert_login(request):
        return redirect('/login/')
    user_id = request.session['user_id']
    user_name = request.session['user_name']
    return user_playlist(request,user_id,user_name)