from django.shortcuts import render, render_to_response

# Create your views here.

def fb_login(request):
    return render_to_response('home.html')