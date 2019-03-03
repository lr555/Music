from django.contrib import admin
from django.urls import path, re_path
from . import views

urlpatterns = [
    path('index/', views.playlist_index, name='index'),
    re_path('detail/(?P<id>[0-9]+)/', views.playlist_detail, name='detail')
]
