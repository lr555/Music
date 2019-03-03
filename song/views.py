# -*- coding: UTF-8 -*-
from django.shortcuts import render,redirect
from django.db import connection
from . import models
from django.http import HttpResponse
import os
import time


# Create your views here.
def song_detail(request, id):
    user_id = request.session.get('user_id', None)
    isLike = request.GET.get('l')
    if isLike and not user_id:
        request.session['message'] = '请先登录'
        return redirect('/login/')

    if isLike == '收藏':
        cursor = connection.cursor()
        cursor.execute('''select * from song_playlist where song_id = {} and playlist_id = {}'''.format(id,user_id))
        result = cursor.fetchall()
        if not result:
            cursor.execute('''insert into song_playlist values({},{})'''.format(id,user_id))
    elif isLike == '取消收藏':
        cursor = connection.cursor()
        cursor.execute('''delete from song_playlist where song_id = {} and playlist_id = {}'''.format(id,user_id))

    
    comment_text = (request.GET.get('comment_text'))
    if comment_text and not user_id:
        request.session['message'] = '请先登录'
        return redirect('/login/')

    if comment_text:
        cursor = connection.cursor()
        cursor.execute('''select * from comments where user_id = {} and song_id = {} and content = '{}';'''.format(user_id,id,comment_text))
        result = cursor.fetchall()
        if not result:
            t = str(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
            cursor.execute('''insert into comments values('{}','{}','{}','{}');'''.format(user_id,id,comment_text,t))

    content = {}
    content['is_login'] = request.session.get('is_login', None)
    cursor = connection.cursor()
    cursor.execute('''select * from song where song_id = {}'''.format(id))
    result = cursor.fetchall()
    if result:
        row = result[0]
        content['song'] = models.Song(row[0], row[1], row[2])
        album_id = row[2]

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

    content['comments'] = []
    cursor.execute('''select * from comments natural inner join users where song_id = {}'''.format(id))
    result = cursor.fetchall()
    if result:
        for row in result:
            content['comments'].append(models.Comments(row[0],row[1],row[2],row[3],row[4]))

    content['isLike'] = None
    result = None
    if user_id:
        cursor.execute('''select * from song_playlist where playlist_id = {} and song_id = {}'''.format(user_id,id))
        result = cursor.fetchall()
    if result:
        content['isLike'] = '取消收藏'
    else:
        content['isLike'] = '收藏'
    lyric = content['song'].name + '.lrc'
    elements = ['static','Database',content['artist'].name,content['album'].name,'lyric',lyric]
    path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    for ele in elements:
        path = os.path.join(path, ele)
    content['lyric'] = []
    with open(path, encoding='utf-8') as file:
        for line in file:
            loc = line.rfind(']')
            if loc:
                line = line[loc+1:]
            if line:
                content['lyric'].append(line)
    return render(request, 'song_detail.html', content)
