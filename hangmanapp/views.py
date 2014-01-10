import random
import json

from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from django.views.generic.base import View
from django.db.models import Sum
from models import Question, Score

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
            random_idx = random.randint(0, Question.objects.count() - 1)
            question = Question.objects.all()[random_idx]
            
        score = 0 #Score.objects.filter(user=request.user).annotate(x=Sum('score'))
        
        if request.user.is_authenticated():
            return render_to_response('index.html', locals())
        
        return render_to_response('home.html')
        

class CreateQuestionView(View):
    @csrf_exempt
    def dispatch(self, *args, **kwargs):
        return super(QuestionView, self).dispatch(*args, **kwargs)
    
    @csrf_exempt
    def post(self, request):
        word = request.POST.get('word')
        hint = request.POST.get('hint')

        question = Question(word=word, hint=hint, created_by=request.user)
        question.save()
        
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
    
    return HttpResponse(status=201)

    
    
