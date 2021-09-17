from django import forms
from django.contrib.auth.forms import  UserCreationForm
from .models import *
from django.contrib.auth import get_user_model
# Create your views here.

User = get_user_model()
class RegisterForm(UserCreationForm):
#profile_year        = blaaa blaa blaaa irrelevant.. You have your own stuff here don't worry about it

   # here is the important part.. add a class Meta-
   class Meta:
      model = User #this is the "YourCustomUser" that you imported at the top of the file  
      fields = ('username', 'password1', 'password2',) #etc etc, other fields you want displayed on the form)

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('email',)


class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ('first_name','last_name',)

class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        exclude = ('customer',)

        
        
    

