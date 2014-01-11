from django.db import models
from django.contrib.auth.models import User

class Question(models.Model):
    word = models.CharField(max_length=50)
    hint = models.CharField(max_length=100)
    created_by = models.ForeignKey(User)
    
    def __unicode__(self):
        return self.word

class Score(models.Model):
    question = models.ForeignKey(Question)
    user = models.ForeignKey(User)
    score = models.IntegerField()
    
    def __unicode__(self):
        return self.question.word