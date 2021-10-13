from .views import *
from django.urls import path,include

app_name = 'customers_api'

urlpatterns = [
    # first argument is the url prefix,
    path('register/', user_register, name='register'),
    path('change_password/', ChangePasswordView.as_view(), name='change_password'),
    path('password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),
    path('add_address/', add_address, name='add_address'),

]

