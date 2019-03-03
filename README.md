# Music Project
## 配置

1. 下载并安装Python(推荐anaconda)

2. 下载并安装mysql

3. conda install mysqlclient(或pip install mysqlclient)

4. pip install django

5. 将数据库文件导入当前电脑的mysql数据库，root为用户名，proj_music为数据库名字，
最后不要修改名字。
```mysql
   mysql -u root -p proj_music < db_music.sql
```

6. 在setting.py中，将
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'proj_music',
        'USER': 'root',
        'PASSWORD': 'asdzxc123',
        'HOST':'localhost',
        'PORT':'3306',
    }
}
```
将NAME和PASSWORD改成你数据库名称和密码。

## run the project
```python
python manage.py runserver
http://localhost:8000
```

## Update 2019.2.13

1. 加入歌单收藏功能

2. 加入注册/登录/登出功能

3. 对用户密码进行MD5加密

4. 修复了许多bug

5. 如果数据库中无法删除users等表的数据，可能是因为外码约束没有设置好的问题，

   可以简单地用workbench，在左边侧边栏，选择相应的表，右击选择alter table，

   将外码的属性改为on delete cascade

6. 要将users表的user_password的域改为varchar(32)，具体操作同5.

7. 对原有触发器进行修改，sql代码如下：

   ```mysql
   drop trigger on_delete_user;
   DELIMITER /
   create trigger on_delete_user
   before delete on users
   for each row
   begin
   	delete from playlist where playlist.playlist_id = old.user_id;
   	delete from playlist where playlist.creator_id = old.user_id;
       delete from user_playlist where user_playlist.user_id = old.user_id;
       delete from comments where comments.user_id = old.user_id;
   end/
   ```

8. **由于增加MD5加密功能，需要对原来的用户密码进行更新，更新代码如下：**

   ```python
   import MySQLdb
   import hashlib
   # passwd为自己数据库的密码
   conn=MySQLdb.connect(host='127.0.0.1',port=3306,user='root',passwd='asdzxc123',
           db='proj_music',charset='utf8')
   cursor=conn.cursor()
   cursor.execute('select user_id,user_password from users;')
   result = cursor.fetchall()
   update_sql = "update users set user_password = '{}' where user_id = {}"
   for row in result:
       print('user_id = {}'.format(row[0]))
       # MD5加密
       new_pwd = hashlib.md5(row[1].encode('utf-8')).hexdigest()
       try:
           cursor.execute(update_sql.format(new_pwd,row[0]))
           conn.commit()
       except:
           conn.rollback()
           print('###update fail###')
       else:
           print('update success')
   ```
