from .views import *
from django.urls import path,include
from rest_framework import routers

app_name = 'products_api'

router = routers.SimpleRouter()
router.register('products', ProductsViewSet, basename="products")

urlpatterns = [
    # first argument is the url prefix,
    # path('register/', user_register, name='register'),
    path('products/', ProductsViewSet.as_view({'get': 'list'}), name='products'),
    path('category/', ProductsByCatViewSet.as_view({'get': 'list'}), name='category'),
    # path("", include(router.urls)),
]

