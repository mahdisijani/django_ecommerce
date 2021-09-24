from django.db import models
from django.db.models.deletion import CASCADE
from django.core.validators import MinValueValidator,MaxValueValidator
# Create your models here.


class Tag(models.Model):
    name = models.CharField(max_length=200, unique=True)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=250)

    def __str__(self):
        return self.name



class Product(models.Model):
    name = models.CharField(max_length=200, unique=True)
    description = models.TextField()
    # main image
    image = models.ImageField(upload_to='product/')
    tags = models.ManyToManyField(Tag)
    category = models.ForeignKey(
        Category, on_delete=CASCADE, related_name="product")
    price = models.IntegerField()
    create_date = models.DateField()

    def __str__(self):
        return self.name

    @property
    def final_price(self):
        discounts = Discount.objects.filter(status='active')
        for discount in discounts:
            if self in discount.products.all():
                return int(self.price - (self.price * discount.amount / 100))
        return self.price

class ProductImage(models.Model):
    # additional image
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='product/')

    def __str__(self):
        return self.product.name

class Discount(models.Model):
    """
    Admin can add Discount  for 
    specific or all products
    """
    percentage = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(0),MaxValueValidator(100)])
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    product = models.ManyToManyField(Product, related_name='discount')
    status_code = (('active', 'active'),
                   ('expired', 'expired'),)
    status = models.CharField(
        max_length=50, choices=status_code, default='active')

    def __str__(self):
        return f"{self.percentage}%"

    