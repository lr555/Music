from django.contrib import admin
from django.urls import path, re_path
from . import views

urlpatterns = [
    path('my_song/', views.my_songs, name='my_song'),
    path('my_playlist/', views.my_playlist, name='my_playlist'),
    re_path('song/(?P<id>[0-9]+)/', views.user_songs, name='song'),
    re_path('playlist/(?P<id>[0-9]+)/', views.user_playlist, name='playlist'),
]
