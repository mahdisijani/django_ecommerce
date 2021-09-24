from django.db import models
from django.db.models.deletion import CASCADE, DO_NOTHING
from django.core.validators import MinValueValidator, MaxValueValidator
from customers.models import Customer
from products.models import Product

# Create your models here.


class Coupon(models.Model):
    """
    Admin can add Coupon for 
    specific or all customers
    """
    code = models.CharField(max_length=50)
    percentage = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)])
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    customer = models.ManyToManyField(Customer, related_name='coupon')
    status_code = (('active', 'active'),
                   ('expired', 'expired'),)
    status = models.CharField(
        max_length=50, choices=status_code, default='active')
    
    def __str__(self):
        return f"{self.percentage}%"


class Order(models.Model):
    customer = models.ForeignKey(
        Customer, on_delete=models.RESTRICT, related_name='order')
    date = models.DateTimeField(auto_now_add=True)
    status_code = (('cancel', 'cancel'),
                   ('success', 'success'),
                   ('process', 'process'),
                   ('deliver', 'deliver'),
                   ('send', 'send'),
                   ('active', 'active'))
    status = models.CharField(choices=status_code, max_length=20)

    def __str__(self):
        return f"{self.id}"


class Cart(models.Model):
    customer = models.OneToOneField(Customer, on_delete=CASCADE)
    coupon = models.ForeignKey(Coupon, null=True, blank=True,on_delete=DO_NOTHING)

    def __str__(self):
        return f"{self.id}"

    def total_price(self):
        return sum([item.total_item_price for item in self.item.all()])

    def final_price(self):
        if self.coupon:
            return int(self.total_price() - (self.total_price() * self.coupon.percentage / 100))
        return self.total_price()


class OrderItem(models.Model):
    order = models.ForeignKey(
        Order, on_delete=models.CASCADE, related_name='item', null=True)
    cart = models.ForeignKey(
        Cart, on_delete=models.CASCADE, related_name='item', null=True)
    product = models.ForeignKey(Product, on_delete=models.RESTRICT)
    quantity = models.PositiveIntegerField()

    def __str__(self):
        return f"{self.product}"

    @property
    def total_item_price(self):
        return self.quantity * self.product.final_price


class Payment(models.Model):
    order = models.OneToOneField(Order, on_delete=models.RESTRICT)
    payment_info = models.CharField(max_length=50)

    def __str__(self):
        return self.id
