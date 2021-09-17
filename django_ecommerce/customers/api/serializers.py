from django.db.models import fields
from rest_framework import serializers
from customers.models import *
from django.contrib.auth import get_user_model
User = get_user_model()


class UserSerializers(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('username', 'password', 'email',)

    def create(self, validated_data):
        user = User.objects.create(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user
   


class CustomerSerializers(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ('user', 'first_name', 'last_name',)


class AddressSerializers(serializers.ModelSerializer):
    class Meta:
        model = Address
        exclude = ('customer',)

    

class ChangePasswordSerializer(serializers.ModelSerializer):
    # password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    password = serializers.CharField(write_only=True, required=True,)
    password2 = serializers.CharField(write_only=True, required=True)
    old_password = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = User
        fields = ('old_password', 'password', 'password2')

    