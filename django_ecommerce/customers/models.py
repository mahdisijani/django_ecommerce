from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.deletion import RESTRICT
# Create your models here.


class User(AbstractUser):
    # Boss = 1
    # Professor = 2
    # Staff = 3
    class_role_choices = (
        (1, 'Admin'),
        (2, 'Staff'),
        (3, 'Customer'),
    )
    role = models.PositiveSmallIntegerField(choices=class_role_choices,
                                            default=3)


class Customer(models.Model):
    user = models.OneToOneField(
        User, related_name='customer', on_delete=RESTRICT)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField()
    address = models.TextField()

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
