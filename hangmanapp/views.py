import random
import json

from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from django.views.generic.base import View

from models import Question, Score

def home(request):
    if request.user.is_authenticated():
        return render_to_response('index.html')
    else:
        return render_to_response('home.html')

class QuestionView(View):
    @csrf_exempt
    def dispatch(self, *args, **kwargs):
        return super(QuestionView, self).dispatch(*args, **kwargs)
    
    def get(self, request, question_id=None):
        #Get a question from id, if no id then random
        if question_id is not None:
            question = Question.objects.get(pk=question_id)
        else:
            random_idx = random.randint(0, Question.objects.count() - 1)
            question = Question.objects.all()[random_idx]
            
        question_dict = dict()
        question_dict['id'] = question.id
        question_dict['word'] = question.word
        question_dict['hint'] = question.hint
        question_dict['user'] = question.created_by.first_name
        
        return HttpResponse(json.dumps(question_dict))
    
    @csrf_exempt
    def post(self, request):
        word = request.POST.get('word')
        hint = request.POST.get('hint')
        
        #qu#question.save()
        
        return HttpResponse(status=201)
        
        