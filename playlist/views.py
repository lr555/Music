from django.shortcuts import render,redirect
from django.db import connection
from . import models
import time


# Create your views here.
def playlist_index(request):
    content = {}
    content['is_login'] = request.session.get('is_login', None)
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
                row[0], row[1], row[2], created_time, row[4], row[5], row[6]
            ))
    return render(request, 'playlist_index.html', content)


def playlist_detail(request, id):
    user_id = request.session.get('user_id', None)
    isLike = request.GET.get('l')
    if isLike and not user_id:
        request.session['message'] = '请先登录'
        return redirect('/login/')

    if isLike == '收藏':
        cursor = connection.cursor()
        cursor.execute('''select * from user_playlist where playlist_id = {} and user_id = {}'''.format(id, user_id))
        result = cursor.fetchall()
        if not result:
            cursor.execute('''insert into user_playlist values({},{})'''.format(user_id,id))
    elif isLike == '取消收藏':
        cursor = connection.cursor()
        cursor.execute('''delete from user_playlist where playlist_id = {} and user_id = {}'''.format(id, user_id))

    content = {}
    content['is_login'] = request.session.get('is_login', None)
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
    content['isLike'] = None
    result = None
    if user_id:
        cursor.execute('''select * from user_playlist where playlist_id = {} and user_id = {}'''.format(id, user_id))
        result = cursor.fetchall()
    if result:
        content['isLike'] = '取消收藏'
    else:
        content['isLike'] = '收藏'
    content['songs'] = []
    cursor.execute('''select song_id,song_name,album_id,album_name,artist_id,artist_name
    from playlist natural join song_playlist natural join song natural join album natural join artist
    where playlist_id = {};'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            content['songs'].append(models.Song(row[0], row[1], row[2],row[3], row[4], row[5]))
    return render(request, 'playlist_detail.html', content)
