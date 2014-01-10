import random
import json
import facebook

from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from django.views.generic.base import View
from django.db.models import Sum
from models import Question, Score
from social_auth.models import UserSocialAuth
from django.conf import settings

def home(request):
    if request.user.is_authenticated():
        return render_to_response('index.html')
    else:
        return render_to_response('home.html')

class HangManView(View):
    def get(self, request, question_id=None):
        if question_id is not None:
            question = Question.objects.get(pk=question_id)
        else:
            if Question.objects.count() > 0:
                random_idx = random.randint(0, Question.objects.count() - 1)
                question = Question.objects.all()[random_idx]
            
                score = Score.objects.filter(user=request.user).annotate(x=Sum('score'))
                root_domain = settings.ROOT_DOMAIN
                if request.user.is_authenticated():
                    return render_to_response('index.html', locals())
            else:
                return render_to_response('index.html', locals())
        return render_to_response('home.html')
        

class CreateQuestionView(View):
    @csrf_exempt
    def dispatch(self, *args, **kwargs):
        return super(CreateQuestionView, self).dispatch(*args, **kwargs)
    
    @csrf_exempt
    def post(self, request):
        word = request.POST.get('word')
        hint = request.POST.get('hint')
        print word
        print hint
        print request.user
        question = Question(word=word, hint=hint, created_by=request.user)
        question.save()
        
        fb_oauth_access_token = UserSocialAuth.get_social_auth_for_user(request.user).filter(provider='facebook')[0].tokens['access_token']
        graph = facebook.GraphAPI(fb_oauth_access_token)
        message = "http://localtest.me/q/%d" % question.id
        graph.put_object("me", "feed", message=message)
        
        return HttpResponse(status=201)

class ScoreView(View):
    @csrf_exempt
    def dispatch(self, *args, **kwargs):
        return super(QuestionView, self).dispatch(*args, **kwargs)
    
    @csrf_exempt
    def post(self, request):
        score = request.POST.get('score')
        question_id = request.POST.get('question_id')
        question = Question.objects.get(pk=question_id)
        
        score = Score(question=question,user=request.user,score=int(score))
        score.save()
        
        return HttpResponse(status=201)
    
    
@csrf_exempt
def post2(request):
    word = request.POST.get('word')
    hint = request.POST.get('hint')
    print word
    print hint
    print request.user
    question = Question(word=word, hint=hint, created_by=request.user)
    question.save()
    
    fb_oauth_access_token = UserSocialAuth.get_social_auth_for_user(request.user).filter(provider='facebook')[0].tokens['access_token']
    graph = facebook.GraphAPI(fb_oauth_access_token)
    message = "http://localtest.me/q/%d" % question.id
    graph.put_object("me", "feed", message=message)
    
    return HttpResponse(status=201)

    
    
