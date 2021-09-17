from django.shortcuts import render
from django.views import generic
from .models import *
# Create your views here.


def index(request):
    products = Product.objects.all()
    categories = Category.objects.all()
    tags = Tag.objects.all()
    return render(request, 'products/index.html', context={'products': products, 'categories': categories, 'tags': tags, })


def product(request, product_id):
    product = Product.objects.get(id=product_id)

    return render(request, 'products/product.html', context={'product': product})

def products_category(request, category_id):
    products = Product.objects.filter(category=category_id)
    categories = Category.objects.all()
    tags = Tag.objects.all()
    return render(request, 'products/products_list.html', context={'products': products, 'categories': categories, 'tags': tags, })

def products_tag(request, tag_id):
    products = Product.objects.filter(tags=tag_id)
    categories = Category.objects.all()
    tags = Tag.objects.all()
    return render(request, 'products/products_list.html', context={'products': products, 'categories': categories, 'tags': tags, })
