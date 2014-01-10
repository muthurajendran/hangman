from django.conf.urls import patterns, include, url
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from views import home, QuestionView

urlpatterns = patterns('',
       url(r'^$', home),
       url(r'^questions/$', login_required(QuestionView.as_view())),
       url(r'^questions/(?P<question_id>\d+)/$', login_required(QuestionView.as_view())),
       )