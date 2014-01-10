from django.conf.urls import patterns, include, url
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from views import home, CreateQuestionView, HangManView, ScoreView

urlpatterns = patterns('',
       url(r'^$', HangManView.as_view()),
       url('^q/(?P<question_id>\d+)/$', HangManView.as_view()),

       url(r'^questions/$', CreateQuestionView.as_view()),
       url(r'^questions/(?P<question_id>\d+)/$', login_required(CreateQuestionView.as_view())),
       
       url(r'^scores/$', ScoreView.as_view()),
       
       )