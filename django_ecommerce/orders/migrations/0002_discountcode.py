# Generated by Django 3.2.7 on 2021-09-10 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
        ('customers', '0004_user_image'),
        ('orders', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='DiscountCode',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=50)),
                ('percentage', models.PositiveSmallIntegerField()),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('customer', models.ManyToManyField(related_name='discount', to='customers.Customer')),
                ('product', models.ManyToManyField(related_name='discount', to='products.Product')),
            ],
        ),
    ]
