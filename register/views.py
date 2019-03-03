from django.shortcuts import render, redirect, HttpResponseRedirect
from django.db import connection
from . import models
import time
import hashlib

# Create your views here.
def display(request):
    content = {}
    content['is_login'] = request.session.get('is_login', None)
    return render(request, 'register.html', content)


def set_user(request, user_id, user_name):
    request.session['is_login'] = True
    request.session['user_id'] = user_id
    request.session['user_name'] = user_name


def register(request):
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
    password_again = request.POST.get('password_again')
    content['message'] = None
    if not (user_name and password and password_again):
        content['message'] = '请填写所有内容！'
    else:
        user_name, password, password_again = user_name.strip(), password.strip(), password_again.strip()
        if not check_user_name(user_name) or not check_password(password):
            content['message'] = '请检查填写的内容！'
        elif password != password_again:
            content['message'] = '两次输入的密码不同！'
        else:
            cursor = connection.cursor()
            cursor.execute('''select * from users where user_name = '{}';'''.format(user_name))
            result = cursor.fetchall()
            if result:
                content['message'] = '用户名已存在'
            else:  # 创建新用户
                cursor.execute('select max(user_id) from USERS')
                user_id = int(cursor.fetchone()[0]) + 1
                # md5 加密
                password = hashlib.md5(password.encode('utf-8')).hexdigest()
                cursor.execute('''insert into USERS
                    VALUES('{}','{}','{}','(1)')'''.format(user_id, user_name, password))
                created_time = int(time.time())
                cursor.execute('''insert into playlist 
                    VALUES('{}','my_favourite','{}','{}','我喜欢的','(3)')'''.format(user_id, user_id,created_time))
                set_user(request, user_id, user_name)
                return redirect('/user/my_song/')
    return render(request, 'register.html', content)

