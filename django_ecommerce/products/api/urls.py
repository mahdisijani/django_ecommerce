from .views import *
from django.urls import path,include
from rest_framework import routers

app_name = 'products_api'

urlpatterns = [
    # first argument is the url prefix,
    path('products/', ProductsViewSet.as_view({'get': 'list'}), name='products'),
    path('category/', ProductsByCatViewSet.as_view({'get': 'list'}), name='category'),
    path('tag/', ProductsByTagViewSet.as_view({'get': 'list'}), name='tag'),
]

