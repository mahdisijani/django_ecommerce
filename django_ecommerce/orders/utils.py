import json
from .models import *


def cart_sync(request):
    cart, created = Cart.objects.get_or_create(user=request.user)

    try:
        #get anonymous user cart and item
        device = request.COOKIES['device']
        temp_cart = Cart.objects.get(device=device)

        #get logged in user item
        items = {item.product for item in cart.item.all()}
        temp_items = {temp_item.product for temp_item in temp_cart.item.all()}
        
        exist_product = temp_items.intersection(items)
        new_product = temp_items.difference(items)

        #sync and update logged in user cart's item with anonymous user cart
        for product in exist_product:
            item = OrderItem.objects.get(cart=cart, product=product)
            temp_item = OrderItem.objects.get(cart=temp_cart, product=product)
            item.quantity += temp_item.quantity
            item.save()
        for product in new_product:
            temp_item = OrderItem.objects.get(
                cart=temp_cart, product=product)
            temp_item.cart = cart
            temp_item.save()
        temp_cart.delete()
        
    except:
        pass
