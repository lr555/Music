from django.contrib import admin
from django.urls import path, re_path
from . import views

urlpatterns = [
    re_path('detail/(?P<id>[0-9]+)/', views.song_detail, name='detail')
]
