from django.test import TestCase
from django.urls import reverse
from orders.models import *
from products.models import Product, Category
from customers.models import Address
from django.contrib.auth import get_user_model
from rest_framework import status
# Create your tests here.

User = get_user_model()


class CartTest(TestCase):
    def setUp(self) -> None:
        # Create a user
        self.user = User.objects.create(username="customer1")
        self.user.set_password("12345678")
        self.user.save()
        # Create an address
        self.address = Address.objects.create(user=self.user)
        # login
        self.client.login(username="customer1", password='12345678')
        # Create a product
        self.category_1 = Category.objects.create(name="category 1")
        self.product_1 = Product.objects.create(
            name="product 1",
            price=20000,
            category=self.category_1,
            stock=10,
        )
        # Create a cart
        self.cart = Cart.objects.create(user=self.user)
        # Create an orderItem
        self.orderItem = OrderItem.objects.create(
            cart=self.cart, product=self.product_1, quantity=2)
        # Create a coupon
        self.coupon = Coupon.objects.create(
            code='coupon-20', percentage=20, start_date='2021-10-06', end_date='2021-10-19')
        self.coupon.user.set([self.user])

    def test_update_item_api(self):
        # correct request
        response = self.client.post(reverse('orders_api:update_item'), data={
            "productId": self.product_1.id,
            "action": "add"
        })
        self.assertEqual(status.HTTP_200_OK, response.status_code)

        # incorrect request
        response = self.client.post(reverse('orders_api:update_item'), data={
            "productId": '123',
            "action": "add"
        })
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response.status_code)

    def test_coupon_api(self):
        response = self.client.post(reverse('orders_api:use_coupon'), data={
            "coupon": self.coupon.code,
        })
        self.assertEqual(status.HTTP_200_OK, response.status_code)

        response = self.client.post(reverse('orders_api:use_coupon'), data={
            "coupon":'wrong code',
        })
        self.assertEqual(status.HTTP_406_NOT_ACCEPTABLE, response.status_code)


    def test_checkout(self):
        response = self.client.post(reverse('orders:checkout'), data={
            "address_id": self.address.id,
        })
        print(Cart.objects.count())
        assert Order.objects.count() == 1
