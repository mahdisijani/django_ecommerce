from django.http.response import JsonResponse
from django.shortcuts import render
from .models import *
from customers.models import Customer
from django.views.decorators.csrf import csrf_exempt
import json
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
