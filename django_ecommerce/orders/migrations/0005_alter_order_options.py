# Generated by Django 3.2.7 on 2021-10-12 15:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0004_alter_orderitem_order'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='order',
            options={'ordering': ('-date',), 'verbose_name': 'Order', 'verbose_name_plural': 'Orders'},
        ),
    ]
