# -*- coding: UTF-8 -*-
from django.shortcuts import render
from django.db import connection
from . import models
from django.http import HttpResponse

# Create your views here.
def song_detail(request):
    return HttpResponse("Hello world !")


