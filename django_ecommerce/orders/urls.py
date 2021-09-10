from .views import *
from django.urls import path

app_name = 'orders'

urlpatterns = [
    # first argument is the url prefix,
    path('updateItem/', updateItem, name='updateItem'),
    
    
]
