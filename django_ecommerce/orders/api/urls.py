from .views import *
from django.urls import path,include
from rest_framework import routers

app_name = 'orders_api'

urlpatterns = [
    # first argument is the url prefix,
    path('use_coupon/', use_coupon, name='use_coupon'),
    path('update_item/', update_item, name='update_item'),
]

