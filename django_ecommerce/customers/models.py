from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models import base
from django.db.models.deletion import RESTRICT
from django.utils.translation import gettext_lazy as _
from django.core.exceptions import ValidationError
from django.dispatch import receiver
from django.urls import reverse
from django_rest_passwordreset.signals import reset_password_token_created
from django.core.mail import send_mail  
# Create your models here.


class User(AbstractUser):
    email=models.EmailField(unique=True,verbose_name=_('email'))
    mobile=models.CharField(max_length=20,null=True,blank=True,unique=True,verbose_name=_('mobile'))
    
    def clean(self):
        if self.mobile != None:
            if  (len(self.mobile) != 11) or (not(self.mobile.isnumeric())):
                raise ValidationError(
                    {'mobile': _('The mobile number is invalid')})
    def save(self, *args, **kwargs):
        self.full_clean()
        return super().save(*args, **kwargs)

class Address(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='address',null=True,verbose_name=_('user'))
    city = models.CharField(max_length=50,verbose_name=_('city'))
    address = models.CharField(max_length=1000,verbose_name=_('address'))
    postalcode = models.CharField(max_length=10,verbose_name=_('postalcode'))

    def __str__(self):
        return f"{self.city} - {self.address}"
    
    class Meta:
       verbose_name = _('Address')
       verbose_name_plural = _('Addresses')


@receiver(reset_password_token_created)
def password_reset_token_created(sender, instance, reset_password_token, *args, **kwargs):

    email_plaintext_message = "{}?token={}".format(reverse('customers_api:password_reset:reset-password-request'), reset_password_token.key)

    send_mail(
        # title:
        "Password Reset for {title}".format(title="MY Ecommerce"),
        # message:
        email_plaintext_message,
        # from:
        "noreply@somehost.local",
        # to:
        [reset_password_token.user.email]
    )