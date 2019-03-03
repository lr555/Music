from django.shortcuts import render
from django.shortcuts import render, redirect,reverse
from django.db import connection
from . import models
import time


# Create your views here.
def logout(request):
    if not request.session.get('is_login', None):
        return redirect(reverse('home:home'))
    request.session.flush()
    return redirect(reverse('home:home'))
