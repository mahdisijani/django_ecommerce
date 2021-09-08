from django.db import models
from django.contrib.auth import get_user_model
from products.models import Product
# Create your models here.

User = get_user_model()

class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.RESTRICT)
    date = models.DateTimeField(auto_now_add=True)
    status_code = (('1', 'cancel'),
                   ('2', 'success'),
                   ('3', 'process'),
                   ('4', 'deliver'),
                   ('5', 'send'),
                   ('6', 'active'))
    status = models.CharField(choices=status_code, max_length=20)

class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    item = models.ForeignKey(Product, on_delete=models.RESTRICT)
    quantity = models.PositiveIntegerField()


class Payment(models.Model):
    order = models.OneToOneField(Order, on_delete=models.RESTRICT)
    payment_info = models.CharField(max_length=50)