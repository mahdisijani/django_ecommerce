from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.deletion import RESTRICT
# Create your models here.


class User(AbstractUser):
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
    email = models.EmailField(null=True, blank=True)
    device = models.CharField(max_length=200, null=True, blank=True) # use in cookies for add to cart without login

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Address(models.Model):
    customer = models.ForeignKey(
        Customer, on_delete=models.CASCADE, related_name='address')
    city = models.CharField(max_length=50)
    address = models.TextField()
    postalcode = models.PositiveBigIntegerField()

    def __str__(self):
        return self.customer