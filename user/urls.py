from django.contrib import admin
from django.urls import path, re_path
from . import views

urlpatterns = [
    re_path('song/(?P<id>[0-9]+)/', views.user_songs, name='song'),
    # re_path('user2/(?P<id>[0-9]+)/', views.album, name='user2'),
    re_path('playlist/(?P<id>[0-9]+)/', views.user_playlist, name='playlist'),
]
