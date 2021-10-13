from django.test import TestCase
from django.urls import reverse
from .models import *
import json

# Create your tests here.

class OrderTest(TestCase):
    def setUp(self) -> None:
        #create tags
        self.tag_1 = Tag.objects.create(name="tag 1")
        self.tag_2 = Tag.objects.create(name="tag 2")
        #create categories
        self.category_1 = Category.objects.create(name="category 1")
        self.category_2 = Category.objects.create(name="category 2")
        #create products
        self.product_1 = Product.objects.create(
            name="product 1",
            price=20000,
            category=self.category_1,
            stock=10,
        )
        self.product_1.tags.set([self.tag_1,self.tag_2])

        self.product_2 = Product.objects.create(
            name="product 2",
            price=25000,
            category=self.category_2,
            stock=12,
        )
        self.product_2.tags.set([self.tag_1,self.tag_2])

    def test_products_api(self):
        response = self.client.get(reverse('products_api:products'))
        response=response.json()
        self.assertTrue(response['count']==2)

    def test_products_by_category_api(self):
        response = self.client.get(reverse('products_api:category'), data={
            "category": self.category_1.id ,
        })
        response=response.json()
        self.assertTrue(response['count']==1)

    def test_products_by_tag_api(self):
        response = self.client.get(reverse('products_api:tag'), data={
            "tag": self.tag_1.name ,
        })
        response=response.json()
        self.assertTrue(response['count']==2)
        