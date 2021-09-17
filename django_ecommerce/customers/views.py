from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from .forms import *
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
# Create your views here.

User = get_user_model()


def register_view(request):
    registerForm=RegisterForm(request.POST)

    
    return render(request, 'customers/register.html', context={'registerForm': registerForm,})


def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        print(user)
        if user is not None:
            print(user)
            login(request, user)
            return redirect("products:index")
    # form=AuthenticationForm()
    return render(request, 'customers/login.html')


def logout_view(request):
    logout(request)
    return redirect('products:index')


def change_password(request):

    return render(request, 'customers/change_password.html')

def password_reset(request):

    return render(request, 'customers/password_reset.html')

def user_info(request):
    
    customer, created = Customer.objects.get_or_create(user=request.user)
    address, created = Address.objects.get_or_create(customer=customer)
    userForm = UserForm(instance=request.user)
    customerForm = CustomerForm(instance=customer)
    addressForm = AddressForm(instance=address)


    return render(request, 'customers/user_info.html', context={'userForm': userForm, 'customerForm': customerForm, 'addressForm': addressForm})
