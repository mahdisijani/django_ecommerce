from .views import *
from django.urls import path,include



urlpatterns = [
    # first argument is the url prefix,
    path('customers/', include('customers.api.urls')), 
    path('products/', include('products.api.urls')),
    path('orders/', include('orders.api.urls')),  
      
    
]

