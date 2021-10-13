from .views import *
from django.urls import path

app_name = 'orders'

urlpatterns = [
    # first argument is the url prefix,
    path('checkout/', checkout, name='checkout'),     
    path('cart/', cart, name='cart'),  
    path('payment/', payment, name='payment'),     
]
