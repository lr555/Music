from django.contrib import admin
from django.urls import path, re_path
from . import views

urlpatterns = [
    path('index/', views.artist_index, name='index'),
    re_path('detail/(?P<id>[0-9]+)/', views.artist_detail, name='detail')
]
