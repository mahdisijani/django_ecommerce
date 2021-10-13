from .views import *
from django.urls import path,include
from django.contrib.auth import views as auth_views
app_name = 'customers'

urlpatterns = [
    # first argument is the url prefix,
    path('register/', register_view, name='register'),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('change_password/', change_password, name='change_password'),
    path('password_reset/', password_reset, name='password_reset'),
    path('user_info/', user_info, name='user_info'),
    path('profile/', profile, name='profile'),
    path('orders_list/', orders_list, name='orders_list'),
    path('last_orders/', last_orders, name='last_orders'), 
    path('order_detail/<int:order_id>/', order_detail, name='order_detail'),   
    path('user_address/', user_address, name='user_address'),   
]
