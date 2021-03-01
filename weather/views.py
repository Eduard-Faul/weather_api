import json
import requests
from django.shortcuts import render
from django.http import HttpResponse
from weather.models import ApiKeys, WeatherResult
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers


def home(request):
    return render(request, template_name='home.html')


def current(request):
    try:
        if request.method != 'GET':
            return HttpResponse('Rather GET', status=500)

        lat = request.GET.get('lat')
        lon = request.GET.get('long')

        res = ApiKeys.objects.get(api_name='weathermap')
        url = 'https://api.openweathermap.org/data/2.5/weather?lat=%s&lon=%s&appid=%s&units=metric' % (lat, lon, res.api_key)
        r = requests.get(url, params=request.GET)
        json_res = r.json()
        if r.status_code == 200:
            return HttpResponse(json.dumps(json_res), status=200, content_type='application/json')
        else:
            return HttpResponse('failed', status=500, content_type='application/json')
    except:
        return HttpResponse('Error occured', status=500, content_type='application/json')


def getAllWeather(request):
    try:
        if request.method != 'GET':
            return HttpResponse('Rather GET', status=500)

        WeatherResult_json = serializers.serialize("json", WeatherResult.objects.all())
        # data = {"WeatherResult_json": WeatherResult_json}
        return HttpResponse(WeatherResult_json, status=200, content_type='application/json')
    except:
        return HttpResponse('Error occured', status=500, content_type='application/json')


@csrf_exempt
def saveWeather(request):
    try:
        if request.method != 'POST':
            return HttpResponse('Rather POST', status=500)

        data = json.loads(request.body)
        WeatherResult.objects.create(response_json=json.dumps(data['weather_json']))
        return HttpResponse('finished', status=200, content_type='application/json')
    except:
        return HttpResponse('Error occured', status=500, content_type='application/json')


def getLatLong(request):
    try:
        if request.method != 'GET':
            return HttpResponse('Rather GET', status=500)

        address = request.GET.get('address')

        res = ApiKeys.objects.get(api_name='mapbox')
        url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/%s.json?access_token=%s&types=address' % (
            address, res.api_key)
        r = requests.get(url, params=request.GET)
        json_res = r.json()
        if r.status_code == 200:
            return HttpResponse(json.dumps(json_res['features']), status=200, content_type='application/json')
        else:
            return HttpResponse('failed', status=500, content_type='application/json')
    except:
        return HttpResponse('Error occured', status=500, content_type='application/json')
