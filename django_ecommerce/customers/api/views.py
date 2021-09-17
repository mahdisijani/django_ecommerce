from rest_framework import status, generics
from rest_framework.views import APIView
from rest_framework import mixins, generics
from rest_framework.decorators import api_view
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
    user_serializer = UserSerializers(data=request.data)
    if user_serializer.is_valid():
        user_serializer.save()
    return   Response(user_serializer.data)


class ChangePasswordView(APIView):
    def get_object(self):
        return self.request.user

    def post(self, request,):
        user = self.get_object()
        serializer = ChangePasswordSerializer(user, data=request.data)
        if serializer.is_valid():
            user.set_password(serializer.validated_data['password'])
            user.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)