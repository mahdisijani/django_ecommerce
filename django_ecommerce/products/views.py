from django.shortcuts import render
from django.views import generic
from .models import *
# Create your views here.


def index(request):
    products = Product.objects.all()
    return render(request, 'products/index.html',context={'products': products, })

def product(request,product_id):
    product = Product.objects.get(id=product_id)
    return render(request, 'products/product.html',context={'product': product })
