from django.db.models import fields
from rest_framework import serializers
from orders.models import *



class CouponSerializers(serializers.Serializer):
    coupon = serializers.CharField(max_length=100)
