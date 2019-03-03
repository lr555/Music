from django.contrib import admin
from django.urls import path, re_path
from django.conf.urls import url
from . import views

urlpatterns = [
    path('home/', views.search_home, name='home'),
    url(r'^detail/$', views.search_detail, name='detail'),
]
