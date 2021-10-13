from re import T
from django.db import models
from django.db.models.deletion import CASCADE, DO_NOTHING
from django.core.validators import MinValueValidator, MaxValueValidator
from customers.models import Address, User
from products.models import Product
from django.utils.translation import gettext_lazy as _
from extensions.utils import jalali_converter
# Create your models here.


class Coupon(models.Model):
    """
    Admin can add Coupon for 
    specific or all customers
    """
    code = models.CharField(max_length=50, verbose_name=_('code'))
    percentage = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)], verbose_name=_('percentage'))
    start_date = models.DateTimeField(verbose_name=_('start_date'))
    end_date = models.DateTimeField(verbose_name=_('end_date'))
    user = models.ManyToManyField(
        User, related_name='coupon', verbose_name=_('user'))
    status_code = (('active', _('active')),
                   ('expired', _('expired')),)
    status = models.CharField(
        max_length=50, choices=status_code, default='active', verbose_name=_('status'))

    def __str__(self):
        return f"{self.percentage}%"

    class Meta:
        verbose_name = _('Coupon')
        verbose_name_plural = _('Coupons')


class Order(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.RESTRICT, related_name='order', verbose_name=_('user'), null=True)
    date = models.DateTimeField(auto_now_add=True, verbose_name=_('date'))
    coupon = models.ForeignKey(
        Coupon, null=True, blank=True, on_delete=models.RESTRICT, verbose_name=_('coupon'))

    status_code = (('process', _('process')),
                   ('send', _('send')), 
                   ('deliver', _('deliver')))
    status = models.CharField(
        choices=status_code, max_length=20, default='process', verbose_name=_('status'))
    address = models.ForeignKey(
        Address, on_delete=models.RESTRICT, null=True, blank=True, verbose_name=_('address'))

    def __str__(self):
        return f"{self.id}"

    class Meta:
        verbose_name = _('Order')
        verbose_name_plural = _('Orders')
        ordering = ('-date',)

    def total_price(self):
        return sum([item.total_item_price for item in self.item.all()])

    def final_price(self):
        if self.coupon:
            return int(self.total_price() - (self.total_price() * self.coupon.percentage / 100))
        return self.total_price()

    def jdate(self):
        return jalali_converter(self.date)


class Cart(models.Model):
    user = models.OneToOneField(
        User, on_delete=CASCADE, verbose_name=_('user'), null=True)
    coupon = models.ForeignKey(
        Coupon, null=True, blank=True, on_delete=models.SET_NULL, verbose_name=_('coupon'))
    # use in cookies for add to cart without login
    device = models.CharField(max_length=200, null=True, blank=True)

    class Meta:
        verbose_name = _('Cart')
        verbose_name_plural = _('Carts')

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
        Order, on_delete=models.CASCADE, related_name='item', null=True, blank=True, verbose_name=_('order'))
    cart = models.ForeignKey(
        Cart, on_delete=models.CASCADE, related_name='item', null=True, blank=True, verbose_name=_('cart'))
    product = models.ForeignKey(
        Product, on_delete=models.RESTRICT, verbose_name=_('product'))
    quantity = models.PositiveIntegerField(
        default=0, verbose_name=_('quantity'))

    class Meta:
        verbose_name = _('OrderItem')
        verbose_name_plural = _('OrderItems')
        ordering = ('-product',)

    def __str__(self):
        return f"{self.product}"

    @property
    def total_item_price(self):
        return self.quantity * self.product.final_price


class Payment(models.Model):
    order = models.OneToOneField(
        Order, on_delete=models.RESTRICT, verbose_name=_('order'))
    payment_info = models.CharField(
        max_length=50, verbose_name=_('payment_info'))

    class Meta:
        verbose_name = _('Payment')
        verbose_name_plural = _('Payments')

    def __str__(self):
        return self.id
