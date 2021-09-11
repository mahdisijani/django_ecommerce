from .views import *
from django.urls import path

app_name = 'products'

urlpatterns = [
    # first argument is the url prefix,
    path('', index, name='index'),
    path('product/<int:product_id>/', product, name='product'),

    
]
