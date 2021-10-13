from rest_framework import status, generics
from rest_framework.views import APIView
from rest_framework import mixins, generics
from rest_framework.decorators import api_view, permission_classes
from django.http import Http404
from rest_framework.response import Response
from rest_framework import permissions
from customers.models import *
from .serializers import *
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model
from rest_framework import generics

# Create your views here.

User = get_user_model()
@api_view(['POST'])
def user_register(request):
    """Create a new User and Customer"""
    register_serializer = RegisterSerializers(data=request.data)
    if register_serializer.is_valid():
        register_serializer.save()
        return Response(register_serializer.data, status=status.HTTP_201_CREATED)
    return Response(register_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ChangePasswordView(APIView):
    """Change logged in User password"""
    permission_classes = (IsAuthenticated,)
    def get_object(self):
        return self.request.user

    def post(self, request,):
        user = self.get_object()
        serializer = ChangePasswordSerializer(user, data=request.data)
        if serializer.is_valid():
            user.set_password(serializer.validated_data['password'])
            user.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def add_address(request):
    """Add New address for Current Customer"""
    address_serializer = AddressSerializers(data=request.data)
    if address_serializer.is_valid():
        address = address_serializer.save()
        address.user = request.user
        address.save()
        return Response(address_serializer.data, status=status.HTTP_201_CREATED)
    return Response(address_serializer.errors, status=status.HTTP_400_BAD_REQUEST)