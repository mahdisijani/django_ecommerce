# Generated by Django 3.2.7 on 2021-09-08 18:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('products', '0001_initial'),
        ('customers', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('status', models.CharField(choices=[('1', 'cancel'), ('2', 'success'), ('3', 'process'), ('4', 'deliver'), ('5', 'send'), ('6', 'active')], max_length=20)),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, related_name='order', to='customers.customer')),
            ],
        ),
        migrations.CreateModel(
            name='ShippingAddress',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('city', models.CharField(max_length=50)),
                ('address', models.TextField()),
                ('postalcode', models.PositiveBigIntegerField()),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='shippingaddress', to='customers.customer')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='orders.order')),
            ],
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payment_info', models.CharField(max_length=50)),
                ('order', models.OneToOneField(on_delete=django.db.models.deletion.RESTRICT, to='orders.order')),
            ],
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.PositiveIntegerField()),
                ('item', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='products.product')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='item', to='orders.order')),
            ],
        ),
    ]