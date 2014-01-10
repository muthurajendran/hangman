from django.shortcuts import render, render_to_response

def home(request):
    if request.user.is_authenticated():
        return render_to_response('index.html')
    else:
        return render_to_response('home.html')

