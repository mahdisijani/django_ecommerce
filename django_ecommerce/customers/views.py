from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from .forms import *
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
from django.contrib import messages
from orders.models import Order
from orders.utils import cart_sync
import datetime
from django.utils.translation import gettext as _
# Create your views here.

User = get_user_model()


def register_view(request):
    """Just render registration page"""

    registerForm = RegisterForm(request.POST)
    return render(request, 'customers/register.html', context={'registerForm': registerForm, })


def login_view(request):
    """Login user and sync cart"""
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            cart_sync(request)
            
            if request.POST.get('next') :
                print(request.POST.get('next'))
                return redirect(request.POST.get('next'))
            return redirect("customers:profile")
        messages.error(request, _('username or password is wrong!'), 'danger')
    return render(request, 'customers/login.html')


def logout_view(request):
    logout(request)
    return redirect('products:index')

@login_required(login_url='customers:login')
def change_password(request):

    return render(request, 'customers/change_password.html')


def password_reset(request):

    return render(request, 'customers/password_reset.html')

@login_required(login_url='customers:login')
def user_info(request):
    """Show and edit user information """
    userForm = UserForm(instance=request.user)
    if request.method == 'POST':
        userForm = UserForm(request.POST, instance=request.user)
        if userForm.is_valid()  :
            userForm.save()
            messages.success(request, _('Your information has been successfully changed'))    

    return render(request, 'customers/user_info.html', context={'userForm': userForm})

@login_required(login_url='customers:login')
def profile(request):

    return render(request, 'customers/profile.html')

@login_required(login_url='customers:login')
def orders_list(request):
    orders = Order.objects.filter(user=request.user)
    context = {'orders': orders}
    return render(request, 'customers/orders_list.html', context)

@login_required(login_url='customers:login')
def last_orders(request):
    """Return user's last orders (10 days) orders """
    orders = Order.objects.filter(user=request.user,
                                  date__gt=datetime.datetime.today()-datetime.timedelta(days=10))
    context = {'orders': orders}
    return render(request, 'customers/orders_list.html', context)

@login_required(login_url='customers:login')
def user_address(request):
    """Return user's addresses  """
    addresses = Address.objects.filter(user=request.user)
    #form for add new address
    addressForm = AddressForm()
    context = {'addresses': addresses, 'addressForm': addressForm}

    return render(request, 'customers/user_address.html', context)

@login_required(login_url='customers:login')
def order_detail(request,order_id):
    order = get_object_or_404(Order, pk=order_id)
    context = {'order': order}
    return render(request, 'customers/order_detail.html', context)