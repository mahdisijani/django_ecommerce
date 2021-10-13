from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.pagination import PageNumberPagination

from products.models import *
from .serializers import *


# Create your views here.

class StandardResultsSetPagination(PageNumberPagination):
    page_size = 2
    page_size_query_param = 'page_size'
    max_page_size = 1000

class ProductsViewSet(ModelViewSet):
    queryset = Product.objects.all().order_by('-create_date')
    serializer_class = ProductSerializers
    pagination_class = StandardResultsSetPagination

class ProductsByCatViewSet(ModelViewSet):
    
    serializer_class = ProductSerializers
    pagination_class = StandardResultsSetPagination

    def get_queryset(self):
        category = self.request.GET.get('category')
        queryset = Product.objects.filter(category=category).order_by('-create_date')
        return queryset

class ProductsByTagViewSet(ModelViewSet):
    
    serializer_class = ProductSerializers
    pagination_class = StandardResultsSetPagination

    def get_queryset(self):
        tag = self.request.GET.get('tag')
        tag= Tag.objects.get(name=tag)
        queryset = Product.objects.filter(tags=tag).order_by('-create_date')
        return queryset