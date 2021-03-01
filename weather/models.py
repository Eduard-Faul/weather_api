from django.db import models

# Create your models here.
class WeatherResult(models.Model):
    response_json = models.TextField(default={})

class ApiKeys(models.Model):
    api_name = models.CharField(primary_key=True, db_index=True, max_length=100)
    api_key = models.TextField(default=None, null=False)