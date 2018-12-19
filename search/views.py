from django.shortcuts import render
from django.shortcuts import render
from django.db import connection
from . import models
import time
# Create your views here.


def search_detail(request):
    q = request.GET.get('q')
    content = {}

    content['songs'] = []
    cursor = connection.cursor()
    cursor.execute('''select song_id,song_name,album_id,album_name,artist_id,artist_name 
    from song natural join album natural join artist 
    where song_name regexp '{}';'''.format(q))
    result = cursor.fetchall()
    # No result
    if not result:
        content['error_msg'] = "未找到相关内容，换个关键字试试吧"
        return render(request, 'search_detail.html', content)

    content['songs'] = []
    if result:
        # content['songs'].append(models.Song(
        #     result[0], result[1], result[2], result[3], result[4], result[5]))
        for row in result:
            content['songs'].append(models.Song(
                row[0], row[1], row[2], row[3], row[4], row[5]))
    return render(request, 'search_detail.html', content)

def search_home(request):
    return render(request,'search_home.html')
