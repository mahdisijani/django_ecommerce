from django.db import models
from django.db.models.deletion import CASCADE

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

class ProductImage(models.Model):
    # additional image
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='product/')

    def __str__(self):
        return self.product.name




    