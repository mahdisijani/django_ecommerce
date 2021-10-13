from django.db.models import fields
from rest_framework import serializers
from customers.models import *
from django.contrib.auth import get_user_model
from rest_framework.fields import CurrentUserDefault
from django.utils.translation import gettext_lazy as _
User = get_user_model()


class RegisterSerializers(serializers.ModelSerializer):
    """User serializer for register new user"""
    class Meta:
        model = User
        fields = ('username', 'password', 'email',)
    
    def validate(self, data):
        if len(data['password']) < 8:
            raise serializers.ValidationError(_('Your password must contain at least 8 characters.'))
        return data
        
    def create(self, validated_data):
        user = User.objects.create(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user


class AddressSerializers(serializers.ModelSerializer):
    """Address serializer used for create new address"""
    class Meta:
        model = Address
        exclude = ('user',)


class ChangePasswordSerializer(serializers.ModelSerializer):
    """Change Password serializer used for Change Password"""
    # password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    password = serializers.CharField(write_only=True, required=True,)
    password2 = serializers.CharField(write_only=True, required=True)
    old_password = serializers.CharField(write_only=True, required=True)

    def validate(self, data):
        if self.instance.check_password(data['old_password'] ):
            if len(data['password']) >= 8:
                if data['password'] == data['password2']:
                    return data
                raise serializers.ValidationError(_('The two password fields didn’t match.'))
            raise serializers.ValidationError(_('Your password must contain at least 8 characters.'))
        raise serializers.ValidationError(_('Your old password was entered incorrectly.'))

    class Meta:
        model = User
        fields = ('old_password', 'password', 'password2')

