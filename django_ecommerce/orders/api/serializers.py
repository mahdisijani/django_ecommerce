from django.db.models import fields
from rest_framework import serializers
from orders.models import *


class CouponSerializers(serializers.Serializer):
    coupon = serializers.CharField(max_length=100)

class AddToCartSerializers(serializers.Serializer):
    productId = serializers.CharField(max_length=100)
    action = serializers.CharField(max_length=100)
    def validate(self, data):
        if Product.objects.filter(id = data['productId']).exists(): 
            if data['action'] in ['add','remove']: 
                return data
            raise serializers.ValidationError('action must be add or remove')
        raise serializers.ValidationError('productId must does not exist')