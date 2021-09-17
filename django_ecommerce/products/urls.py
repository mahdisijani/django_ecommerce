from .views import *
from django.urls import path

app_name = 'products'

urlpatterns = [
    # first argument is the url prefix,
    path('', index, name='index'),
    path('product/<int:product_id>/', product, name='product'),
    path('products_category/<int:category_id>/', products_category, name='products_category'),
    path('products_tag/<int:tag_id>/', products_tag, name='products_tag'),
    
]
