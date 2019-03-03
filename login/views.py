from django.shortcuts import render, redirect, HttpResponseRedirect
from django.db import connection
from . import models
import time
import hashlib

# Create your views here.
def display(request):
    content = {}
    content['is_login'] = request.session.get('is_login', None)
    if request.session.get('message', None) and request.session['message']:
        content['message'] = request.session['message']
        del request.session['message']
    return render(request, 'login.html', content)


def set_user(request, user_id, user_name):
    request.session['is_login'] = True
    request.session['user_id'] = user_id
    request.session['user_name'] = user_name

def login(request):
    def check_user_name(user_name):
        if not (len(user_name) >= 3 and len(user_name) <= 18):
            return False
        elif len(user_name.split()) > 1:
            return False
        return True

    def check_password(password):
        if not (len(password) >= 6 and len(password) <= 16):
            return False
        return True

    content = {}
    content['is_login'] = request.session.get('is_login', None)
    user_name = request.POST.get('user_name')
    password = request.POST.get('password')
    content['message'] = None
    if not (user_name and password):
        content['message'] = '请填写所有内容！'
    else:
        user_name, password = user_name.strip(), password.strip()
        if not check_user_name(user_name) or not check_password(password):
            content['message'] = '请检查填写的内容！'
        else:
            cursor = connection.cursor()
            cursor.execute('''select * from users where user_name = '{}';'''.format(user_name))
            result = cursor.fetchone()
            if not result:
                content['message'] = '用户名不存在'
            elif hashlib.md5(password.encode('utf-8')).hexdigest() != result[2]:
                content['message'] = '密码不正确'
            else:
                set_user(request, result[0], result[1])
                return redirect('/user/my_song/')
    return render(request,'login.html',content)