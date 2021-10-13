from django.http.response import JsonResponse
from django.shortcuts import render, get_object_or_404, redirect
from .models import *
from customers.forms import AddressForm
from django.views.decorators.csrf import csrf_exempt
import json
import datetime
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.utils.translation import gettext as _
from django.contrib.auth import get_user_model
# Create your views here.
User = get_user_model()

def cart(request):
    """If user logged in get his cart, 
    else create a temporary cart by deviceID which store in cookie."""
    try:
        cart, created = Cart.objects.get_or_create(user=request.user)
    except:
        device = request.COOKIES['device']
        cart, created = Cart.objects.get_or_create(device=device)

    for item in cart.item.all():
        if item.product.stock < item.quantity:
            messages.warning(request, _("Only {} of {} remain.").format(item.product.stock,item.product.name))
    context = {'cart': cart}
    return render(request, 'orders/cart.html', context)


@login_required(login_url='customers:login')
def checkout(request):
    """Get user's cart and address and cretae a new order"""
    cart = Cart.objects.get(user=request.user)
    for item in cart.item.all():
            if item.product.stock < item.quantity:
                return redirect("orders:cart")
    
    if request.method == 'POST':
        
        try:
            address_id = request.POST['address_id']
            address = Address.objects.get(id=address_id)
            
            order = Order.objects.create(
                user=request.user, address=address)
            
            # add coupon to order
            order.coupon = cart.coupon
            order.save()
            # put cart item to order
            for item in cart.item.all():
                item.product.stock -= item.quantity
                item.product.save()
                if item.product.stock <= 0:
                    item.product.is_active = False
                item.order = order
                item.cart = None
                item.save()
            cart.delete()
            Payment.objects.create(order=order, payment_info='123456789')
            return redirect("orders:payment")

        except:
            messages.error(
                request, _('Select an Address'), 'danger')
    cart = Cart.objects.get(user=request.user)
    addresses = Address.objects.filter(user=request.user)
    addressForm = AddressForm()
    context = {'cart': cart, 'addresses': addresses,
               'addressForm': addressForm}
    return render(request, 'orders/checkout.html', context)


@login_required(login_url='customers:login')
def payment(request):
    messages.success(request, _('Your order has been successfully submitted'))
    return render(request, 'orders/payment.html')
