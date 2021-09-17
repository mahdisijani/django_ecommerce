from rest_framework import status,generics
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from django.http import Http404
from rest_framework.response import Response
from rest_framework import permissions
from .serializers import *
# Create your views here.
