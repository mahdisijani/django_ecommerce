from django.test import TestCase
from django.contrib.auth import get_user_model
from django.urls import reverse
from rest_framework import status
# Create your tests here.

User = get_user_model()

class UserTest(TestCase):
    def setUp(self) -> None:
        self.user = User.objects.create(
            username="customer1"
        )
        self.user.set_password("12345678")
        self.user.save()
        
    def test_login(self):
        response = self.client.post(reverse('customers:login'), data={
            "username": 'customer1',
            "password": "12345678"
        })
        response = self.client.get(reverse('products:index'))
        self.assertTrue(response.context['user'].is_authenticated)
        

    def test_register(self):
        response = self.client.post(reverse('customers_api:register'), data={
            "username": 'customer2',
            "password": "12345678",
            "email": "customer2@gmail.com"
        })
        assert User.objects.count() == 2
        
    def change_password_test(self):
        self.client.post(reverse('customers:login'), data={
            "username": 'customer1',
            "password": "12345678"
        })
        response = self.client.post(reverse('customers_api:change_password'), data={
            "old_password": '12345678',
            "password": "cust_1234",
            "password2": "cust_1234"
        })
        self.assertEqual(status.HTTP_200_OK, response.status_code)
        response = self.client.post(reverse('customers_api:change_password'), data={
            "old_password": '12345678',
            "password": "cust_1234",
            "password2": "asddhks"
        })
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response.status_code)       