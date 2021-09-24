from django.http.response import JsonResponse
from django.shortcuts import render
from .models import *
from customers.models import Customer
from django.views.decorators.csrf import csrf_exempt
import json
import datetime
# Create your views here.


def cart(request):
    try:
        customer = request.user.customer
    except:
        device = request.COOKIES['device']
        customer, created = Customer.objects.get_or_create(device=device)

    order, created = Order.objects.get_or_create(
        customer=customer, complete=False)

    context = {'order': order}
    return render(request, 'store/cart.html', context)


def updateItem(request):

    data = json.loads(request.body)
    productId = data["productId"]
    quantity = data["quantity"]
    return JsonResponse({"status": 200})


def orders_list(request):
    orders = Order.objects.filter(customer=request.user.customer)
    context = {'orders': orders}
    return render(request, 'orders/orders_list.html', context)


def last_orders(request):
    orders = Order.objects.filter(customer=request.user.customer,
                                  date__gt=datetime.datetime.today()-datetime.timedelta(days=10))
    context = {'orders': orders}
    return render(request, 'orders/orders_list.html', context)


def cart(request):
    cart = Cart.objects.get(customer=request.user.customer)
    context = {'cart': cart}
    return render(request, 'orders/cart.html', context)

def checkout(request):
    cart = Cart.objects.get(customer=request.user.customer)
    context = {'cart': cart}
    return render(request, 'orders/checkout.html', context)


