from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import *
from django.contrib.auth import get_user_model
# Create your views here.

User = get_user_model()
class RegisterForm(UserCreationForm):
   class Meta:
      model = User 
      fields = ('username', 'password1', 'password2',) 

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('email','first_name','last_name','mobile',)


class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        exclude = ('customer',)

        
        
class CustomUserCreationForm(UserCreationForm):

    class Meta:
        model = User
        fields = ('username','email',)
