from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.deletion import RESTRICT

from django.dispatch import receiver
from django.urls import reverse
from django_rest_passwordreset.signals import reset_password_token_created
from django.core.mail import send_mail  
# Create your models here.


class User(AbstractUser):
    email=models.EmailField(unique=True,verbose_name='ایمیل')
    image = models.ImageField(upload_to='user/', null=True, blank=True)
    class_role_choices = (
        (1, 'Admin'),
        (2, 'Staff'),
        (3, 'Customer'),
    )
    role = models.PositiveSmallIntegerField(choices=class_role_choices,
                                            default=3)


class Customer(models.Model):
    user = models.OneToOneField(
        User, related_name='customer', on_delete=RESTRICT, null=True, blank=True)
    first_name = models.CharField(max_length=50, null=True, blank=True)
    last_name = models.CharField(max_length=50, null=True, blank=True)
    # email = models.EmailField(null=True, blank=True)
    device = models.CharField(max_length=200, null=True, blank=True) # use in cookies for add to cart without login

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Address(models.Model):
    customer = models.ForeignKey(
        Customer, on_delete=models.CASCADE, related_name='address',null=True)
    city = models.CharField(max_length=50)
    address = models.CharField(max_length=1000)
    postalcode = models.CharField(max_length=10)

    def __str__(self):
        return f"{self.customer.first_name} {self.customer.last_name}"

@receiver(reset_password_token_created)
def password_reset_token_created(sender, instance, reset_password_token, *args, **kwargs):

    email_plaintext_message = "{}?token={}".format(reverse('customers_api:password_reset:reset-password-request'), reset_password_token.key)

    send_mail(
        # title:
        "Password Reset for {title}".format(title="MY Ecommerce"),
        # message:
        email_plaintext_message,
        # from:
        "noreply@somehost.local",
        # to:
        [reset_password_token.user.email]
    )