from django.db import models
from django.db.models.deletion import CASCADE
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils.translation import gettext_lazy as _
# Create your models here.


class Tag(models.Model):
    name = models.CharField(max_length=200, unique=True,
                            verbose_name=_('name'))

    class Meta:
        verbose_name = _('Tag')
        verbose_name_plural = _('Tags')

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=250, verbose_name=_('name'))

    class Meta:
        verbose_name = _('Category')
        verbose_name_plural = _('Categories')

    def __str__(self):
        return self.name


class Product(models.Model):
    name = models.CharField(max_length=200, unique=True,
                            verbose_name=_('name'))
    description = models.TextField(verbose_name=_('description'))
    # main image
    image = models.ImageField(upload_to='product/', verbose_name=_('image'))
    tags = models.ManyToManyField(Tag, verbose_name=_('tags'))
    category = models.ForeignKey(
        Category, on_delete=models.RESTRICT, related_name="product", verbose_name=_('category'))
    price = models.IntegerField(verbose_name=_('price'))
    stock = models.PositiveIntegerField(verbose_name=_('stock'))
    is_active = models.BooleanField(verbose_name=_('active'), default=True)
    create_date = models.DateField(
        auto_now_add=True, verbose_name=_('create date'))

    class Meta:
        verbose_name = _('Product')
        verbose_name_plural = _('Products')
        ordering = ('-create_date',)

    def __str__(self):
        return self.name

    @property
    def final_price(self):
        discounts = Discount.objects.filter(status='active')
        for discount in discounts:
            if self in discount.products.all():
                return int(self.price - (self.price * discount.percentage / 100))
        return self.price


class ProductImage(models.Model):
    # additional image
    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, related_name='images', verbose_name=_('product'))
    image = models.ImageField(upload_to='product/', verbose_name=_('image'))

    class Meta:
        verbose_name = _('ProductImage')
        verbose_name_plural = _('ProductImages')

    def __str__(self):
        return self.product.name


class Discount(models.Model):
    """
    Admin can add Discount  for 
    specific or all products
    """
    percentage = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)], verbose_name=_('percentage'))
    start_date = models.DateTimeField(verbose_name=_('start date'))
    end_date = models.DateTimeField(verbose_name=_('end date'))
    products = models.ManyToManyField(
        Product, related_name='product', verbose_name=_('product'))
    status_code = (('active', _('active')),
                   ('expired', _('expired')),)
    status = models.CharField(
        max_length=50, choices=status_code, default='active', verbose_name=_('status'))

    class Meta:
        verbose_name = _('Discount')
        verbose_name_plural = _('Discounts')

    def __str__(self):
        return f"{self.percentage}%"
