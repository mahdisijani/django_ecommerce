from django.http.response import HttpResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework import status
from orders.models import *
from .serializers import *


# Create your views here.

@api_view(['POST'])
def use_coupon(request):
    serializer = CouponSerializers(data=request.data)
    if serializer.is_valid():
        coupon_code = serializer.data['coupon']
        user_coupons = request.user.customer.coupon.filter(status='active')
        for coupon in user_coupons:
            if coupon.code == coupon_code:
                cart = request.user.customer.cart
                cart.coupon = coupon
                return Response(cart.final_price(),status=status.HTTP_200_OK)
        return Response(status=status.HTTP_406_NOT_ACCEPTABLE)
    return Response(status=status.HTTP_406_NOT_ACCEPTABLE)

