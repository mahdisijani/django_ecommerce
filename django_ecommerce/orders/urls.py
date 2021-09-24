from .views import *
from django.urls import path

app_name = 'orders'

urlpatterns = [
    # first argument is the url prefix,
    path('updateItem/', updateItem, name='updateItem'),
    path('orders_list/', orders_list, name='orders_list'),
    path('last_orders/', last_orders, name='last_orders'),   
    path('checkout/', checkout, name='checkout'),     
    path('cart/', cart, name='cart'),     
    
]
