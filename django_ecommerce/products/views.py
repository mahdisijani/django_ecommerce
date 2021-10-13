from django.shortcuts import render,redirect
from django.views import generic
from .models import *
from django.utils.translation import activate
from django.db.models import Q
# Create your views here.


def index(request):
    query = request.GET.get('q')
    if query:
        products = Product.objects.filter(
            Q(name__icontains=query) | Q(category__name__icontains=query)) 
    else:
        products = Product.objects.all()
    categories = Category.objects.all()
    tags = Tag.objects.all()
    return render(request, 'products/index.html', context={'products': products, 'categories': categories, 'tags': tags, })

def change_lang(request):
    activate(request.GET.get('lang'))
    return redirect(request.GET.get('next'))

def product(request, product_id=None):
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


def products(request):
    categories = Category.objects.all()
    tags = Tag.objects.all()
    return render(request, 'products/products_list.html', context={'categories': categories, 'tags': tags, })
