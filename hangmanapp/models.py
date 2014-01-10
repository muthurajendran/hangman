from django.db import models
from django.contrib.auth.models import User

class Question(models.Model):
    word = models.CharField(max_length=50)
    hint = models.CharField(max_length=100)
    created_by = models.OneToOneField(User)

class Score(models.Model):
    question = models.OneToOneField(Question)
    user = models.OneToOneField(User)
    score = models.IntegerField()