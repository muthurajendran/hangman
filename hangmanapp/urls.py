from django.conf.urls import patterns, include, url
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from views import home, QuestionView, post2, HangManView

urlpatterns = patterns('',
       url(r'^$', HangManView.as_view()),
       url('^q/(?P<question_id>\d+)/$', HangManView.as_view()),

       url(r'^questions/$', QuestionView.as_view()),
       url(r'^questions2/$', post2),
       url(r'^questions/(?P<question_id>\d+)/$', login_required(QuestionView.as_view())),
       )