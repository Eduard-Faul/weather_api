from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

urlpatterns = [
    path('', views.home, name='index'),
    path('current', views.current, name='current'),
    path('getAllWeather', views.getAllWeather, name='getAllWeather'),
    path('getLatLong', views.getLatLong, name='getLatLong'),
    path('saveWeather', views.saveWeather, name='saveWeather'),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)