from django.http.response import HttpResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework import status
from orders.models import *
from .serializers import *
import json

# Create your views here.


@api_view(['POST'])
def use_coupon(request):
    """If user has coupon can use it"""
    serializer = CouponSerializers(data=request.data)
    if serializer.is_valid():
        coupon_code = serializer.data['coupon']
        # get all user's active coupons
        user_coupons = request.user.coupon.filter(status='active')
        for coupon in user_coupons:
            # check coupon code is correct
            if coupon.code == coupon_code:
                # add coupon to user's cart
                cart = request.user.cart
                cart.coupon = coupon
                cart.save()
                return Response(cart.final_price(), status=status.HTTP_200_OK)
        return Response(status=status.HTTP_406_NOT_ACCEPTABLE)
    return Response(status=status.HTTP_406_NOT_ACCEPTABLE)


@api_view(['POST'])
def update_item(request):
    """If user logged in get his cart, 
    else create a temporary customer by deviceID which store in cookie.
    Then update cart's item """
    
    serializer = AddToCartSerializers(data=request.data)
    if serializer.is_valid():
        productId = serializer.data['productId']
        action = serializer.data['action']

        if request.user.is_authenticated:
            cart, created = Cart.objects.get_or_create(user=request.user)
        else:
            device = request.COOKIES['device']
            cart, created = Cart.objects.get_or_create(device=device)
        
        product = Product.objects.get(id=productId)
        orderItem, created = OrderItem.objects.get_or_create(
            cart=cart, product=product)
        if action == 'add':
            orderItem.quantity = (orderItem.quantity + 1)
        elif action == 'remove':
            orderItem.quantity = (orderItem.quantity - 1)
        orderItem.save()

        if orderItem.quantity <= 0:
            orderItem.delete()
        return Response('Item was added', status=status.HTTP_200_OK)
    return Response(status=status.HTTP_400_BAD_REQUEST)
