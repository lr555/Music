# music

To start, input the command ```python manage.py runserver```
---  
修改：
1. 创建了user
2. 修改了一些原有逻辑，如：显示推荐歌单时不显示‘我喜欢的音乐’
3. 增加了一些sql语句
4. 在Database/others中增加了一张名为user.jpg的图片

未解决的问题：
1.base.html中无法访问到我的空间，因为没找到解决url问题的方法

访问方法：<br/>
http://localhost:8000/user/playlist/1551/<br/>
http://localhost:8000/user/song/1551/

sql语句：(歌单id==用户id表示为我喜欢的音乐歌单)
```
insert into playlist values('1551','my_favourite','1551','0','我喜欢的','(3)');
insert into song_playlist values('108132','1551');
insert into song_playlist values('108134','1551');
insert into song_playlist values('108136','1551');
insert into song_playlist values('108138','1551');
```
