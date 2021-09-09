from django.db import models
from customers.models import Customer
from products.models import Product

# Create your models here.



class Order(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT,related_name='order')
    date = models.DateTimeField(auto_now_add=True)
    status_code = (('1', 'cancel'),
                   ('2', 'success'),
                   ('3', 'process'),
                   ('4', 'deliver'),
                   ('5', 'send'),
                   ('6', 'active'))
    status = models.CharField(choices=status_code, max_length=20)

    def __str__(self):
        return self.id


class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE,related_name='item')
    item = models.ForeignKey(Product, on_delete=models.RESTRICT)
    quantity = models.PositiveIntegerField()
    
    def __str__(self):
        return f"{self.order}-{self.item}"


class Payment(models.Model):
    order = models.OneToOneField(Order, on_delete=models.RESTRICT)
    payment_info = models.CharField(max_length=50)

    def __str__(self):
        return self.id

class ShippingAddress(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE,related_name='shippingaddress')
    order = models.ForeignKey(Order, on_delete=models.DO_NOTHING)
    city=models.CharField(max_length=50)
    address=models.TextField()
    postalcode=models.PositiveBigIntegerField()

    def __str__(self):
        return self.customer
